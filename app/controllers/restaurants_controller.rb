class RestaurantsController < ApplicationController
  def index
    params[:search].presence ? query = params[:search][:query] : query = "*"
    options = {fields: [:name, :cuisine], operator: "or", match: :word_middle}
    @restaurants = policy_scope(Restaurant).search(query, options)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @new_recommendation = Selection.new
    @markers = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }
  end

end
