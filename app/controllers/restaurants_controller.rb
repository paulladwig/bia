class RestaurantsController < ApplicationController
  def index
    if params[:search].presence
      search_params[:query].presence ? query = search_params[:query] : query = "*"
    else
      query = "*"
    end
    options = {fields: ["name^10", "cuisine^2", :recommended], suggest: true, per_page: 24, operator: "or", match: :word_middle, page: params[:page]}
    options[:where] = where
    options[:boost_by_distance] = boost_by_distance
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
    @reviews = Selection.where(user: current_user, restaurant: @restaurant).or(Selection.where(user: User.following(current_user, "instance"), restaurant: @restaurant))
  end

  def new
    @restaurant = Restaurant.new()
    authorize @restaurant
    @results = []
    # check if search query was executed by the user
    if params[:search].presence
      search_query = search_params[:query]
      location = location_coords
      if location[:longitude] != 'na'
        # use search input to find places using google api
        p nearby_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location[:latitude]},#{location[:longitude]}&radius=#{location[:range]}&type=restaurant&keyword=#{search_query}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
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
        location_string = user_default_location
        # execute google places text search
        p text_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{search_query}&#{location_string}type=restaurant&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
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
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(18)
    @current_page = @results.current_page
    @total_pages = @results.total_pages
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    p details_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{restaurant_params["placeid"]}&fields=formatted_phone_number,website&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
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

  def where
    where = {id: Restaurant.relevant_restaurants(current_user, "id")}
    if params[:search].presence
      if params[:search][:location].presence
        location = location_coords
        if location != 'na'
          where[:location] = {near: {lat: location[:latitude], lon: location[:longitude]}, within: "#{location[:range]/1000}km"}
        end
      end
      if search_params[:cuisine][1].presence
        # _or: [{in_stock: true}, {backordered: true}]
      end
    end
    where
  end

  def boost_by_distance
    boost = {}
    if params[:search].presence
      location = location_coords
      if location != 'na'
        boost[:location] = {origin: {lat: location[:latitude], lon: location[:longitude]}}
      end
    end
    boost
  end

  def location_coords
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

      if longitude != 'na'
        # check if a range was given by the user, othwerwise the default of 5000 is used
        if search_params[:range].present?
          range = search_params[:range].to_i * 1000
        end
      end

    { longitude: longitude, latitude: latitude, range: range }
  end

  def user_default_location
    # Providing some location reference improves results though, therefore check if the user has
    # set a home location on their profile, use it to improve search results
    if current_user.location.present?
      location_string = "location=#{current_user.latitude},#{current_user.longitude}&radius=#{50000}&"
    else
      location_string = ''
    end
  end

  def search_params
    params.require(:search).permit(:query, :lat, :long, :location, :range, :cuisine => [])
  end

  def restaurant_params
    params.permit(:address, :external_photo, :name, :placeid)
  end
end
