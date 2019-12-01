class RestaurantsController < ApplicationController
  def index
    params[:search].presence ? query = params[:search][:query] : query = "*"
    # if params[:search][:location] || params[:sear]
    options = {fields: ["name^10", "cuisine^2", :recommended], suggest: true, per_page: 24, operator: "or", match: :word_middle, page: params[:page], where: {_or: [{id: current_user.restaurants.ids}, {id: reciever_restaurants}]}}
    # keep for user search
    # options = {fields: [:name, :cuisine, :recommended, :friendname, :username, :email], operator: "or", match: :word_middle}
    # @your_users = policy_scope(User).search(search_query, options)
    @restaurants = policy_scope(Restaurant).search(query, options)
    @current_user = current_user
    @current_page = @restaurants.current_page
    @total_pages = @restaurants.total_pages
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @new_recommendation = Selection.new
    @markers = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
    }
    @reviews = Selection.where(user: current_user, restaurant: @restaurant).or(Selection.where(user: current_user.receivers, restaurant: @restaurant))
  end

  def new
    @restaurant = Restaurant.new()
    authorize @restaurant
    @results = []
    # check if search query was executed by the user
    if params[:search].presence
      search_query = search_params[:query]
      longitude = search_params[:long]
      latitude = search_params[:lat]
      range = 5000

      # check if a location was provided by the user,
      # if true the location determined by the browser is overwritten
      if search_params[:location].present?
        coordinates = convert_location(search_params[:location])
        latitude = coordinates[0]
        longitude = coordinates[1]
      end
      # check if a location was found using the browser or
      # given by the user, if true search for nearby places will be executed
      if longitude != 'na'

        # check if a range was given by the user, othwerwise the default of 5000 is used
        if search_params[:range].present?
          range = search_params[:range]
        end

        # use search input to find places using google api
        nearby_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{range}&type=restaurant&keyword=#{search_query}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
        json_sereialized = JSON.parse(open(nearby_url).read)
        json_sereialized["results"].each do |result|
          # incase google does not provide a photo set photo to nil to avoid method error
          if result["photos"]
            photo = result["photos"][0]
          else
            photo = nil
          end
          @results << [result["name"], result["vicinity"], result["place_id"], photo]
        end

      # if no location was found using the browser and nothing was given in the location field,
      # do a text search which does not require a location
      else

        # Providing some location reference improves results though, therefore check if the user has
        # set a home location on their profile, use it to improve search results
        if current_user.location.present?
          location_string = "location=#{current_user.latitude},#{current_user.longitude}&radius=#{50000}&"
        else
          location_string = ''
        end

        # execute google places text search
        text_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{search_query}&#{location_string}type=restaurant&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
        json_sereialized_text = JSON.parse(open(text_url).read)
        json_sereialized_text["results"].each do |result|
          if result["photos"]
            photo = result["photos"][0]
          else
            photo = nil
          end
          @results << [result["name"], result["formatted_address"], result["place_id"], photo]
        end
      end

      # check if the restaurant exists in the database if not create a new instace to show to the user
      @results.map! do |result|
        database_record = Restaurant.where(placeid: result[2])
        if database_record != []
          {restaurant: database_record[0], existing_reccord: true}
        else
          if result[3].present?
            photos_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{result[3]["photo_reference"]}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
          else
            photos_url = "https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1947&q=80"
          end
          { restaurant:
            Restaurant.new(
              name: result[0],
              address: result[1],
              external_photo: photos_url,
              placeid: result[2]
            ),
            existing_reccord: false }
        end
      end
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    details_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{restaurant_params["placeid"]}&fields=formatted_phone_number,website&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    json_sereialized = JSON.parse(open(details_url).read)
    @restaurant.phone_number = json_sereialized["result"]["formatted_phone_number"] if json_sereialized["result"]["formatted_phone_number"]
    @restaurant.url = json_sereialized["result"]["website"] if json_sereialized["result"]["website"]
    if @restaurant.save
      redirect_to restaurant_path(@restaurant, new: true)
    else
      render :new
    end
  end

  private

  def convert_location(location)
    Geocoder.search(search_params[:location]).first.coordinates
  end

  def reciever_restaurants
    receivers = current_user.receivers
    all_selections = []
    restaurants = []
    receivers.each { |receiver| all_selections << receiver.selections }
    all_selections.each do |user_selections|
      user_selections.each do |selection|
        restaurants << selection.restaurant if selection.recommended == true
      end
    end
    restaurants.map!{ |restaurant| restaurant.id }
  end

  def search_params
    params.require(:search).permit(:query, :lat, :long, :location, :range)
  end

  def restaurant_params
    params.permit(:address, :external_photo, :name, :placeid)
  end
end
