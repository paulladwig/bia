class RestaurantsController < ApplicationController
  CUISINES = ['Italian', 'Asian-inspired', 'Vietnamese', 'German', 'Pizza', 'Fast Food',
  'Breakfast & Brunch', "Pan Asian", "Kebab", "Burgers", "Sushi Bars", "Mediterranean", "Indian", "Turkish",
  "Chinese", "Bakeries", "Coffee & Tea", "Thai", "Middle Eastern", "Greek", "Steakhouses", "French",
  "Patisserie / Cake Shop", "Vegan", "Sandwiches", "Modern European", "Ice Cream & Frozen Yogurt", "Korean",
  "Mexican", "Japanese", "Arabian", "Salad", "Vegetarian", "Barbeque", "Falafel", "Spanish", "Lebanese",
  "Austrian", "Seafood", "Soup", "Tapas", "American", "Buffets", "Creperies", "Waffles", "Asian Fusion", "Russian",
  "Argentine", "Latin American", "Wine Bars", "Cajun" , "Caribbean", "Moroccan", "Swedish", "Latvian", "Scottish",
  "British", "Russian", "Jewish", "Canadian", "Polish", "Hawaiian", "Brazilian", "Peruvian", "Salvadorian",
  "Cuban", "Tibetan", "Egyptian", "Belgian", "Irish", "Welsh", "Mormon", "Portuguese", "Haitian",
  "Tahitian", "Kenyan", "Algerian", "Nigerian", "Libyan"]
  def index
    params[:search].presence ? query = params[:search][:query] : query = "*"
    options = {fields: [:name, :cuisine, :recommended], operator: "or", match: :word_middle}
    @restaurants = policy_scope(Restaurant).search(query, options)
    @current_user = current_user
    @cuisines = CUISINES
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
end
