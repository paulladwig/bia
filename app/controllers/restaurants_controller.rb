class RestaurantsController < ApplicationController
  STORE = []

  def index
    params[:search].presence ? query = params[:search][:query] : query = "*"
    options = {fields: ["name^10", "cuisine^2", :recommended], operator: "or", match: :word_middle, where: {_or: [{id: current_user.restaurants.ids}, {id: reciever_restaurants}]}}
    # keep for user search
    # options = {fields: [:name, :cuisine, :recommended, :friendname, :username, :email], operator: "or", match: :word_middle}
    # @your_users = policy_scope(User).search(search_query, options)
    @restaurants = policy_scope(Restaurant).search(query, options)
    @current_user = current_user
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
          if result["photos"]
            photo = result["photos"][0]
          else
            photo = nil
          end
          @results << [result["name"], result["vicinity"], result["place_id"], photo]
        end
      else
        if current_user.location.present?
          location_string = "location=#{current_user.latitude},#{current_user.longitude}&radius=#{50000}&"
        else
          location_string = ''
        end

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

      params[:search].presence ? query = params[:search][:query] : query = "*"
      your_options = {fields: ["name^10"], operator: "or", limit: 3, match: :word_middle, misspellings: {below: 5}, where: {_or: [{id: current_user.restaurants.ids}, {id: reciever_restaurants}]}}
      @your_restaurants = policy_scope(Restaurant).search(search_query, your_options)

      @results.map! do |result|
        database_record = Restaurant.where(placeid: result[2])
        if database_record != []
          database_record[0]
        else
          # details_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{result[2]}&fields=opening_hours,formatted_address,formatted_phone_number,photo&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
          # json_sereialized = JSON.parse(open(details_url).read)
          if result[3].present?
            photos_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{result[3]["photo_reference"]}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
          else
            photos_url = "https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1947&q=80"
          end
          Restaurant.new({
            name: result[0],
            address: result[1],
            # phone_number:
            # url:
            external_photo: photos_url,
            # email:
            placeid: result[2],
          })
        end
      end
      STORE = @results
    end
  end

  def create

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

end
