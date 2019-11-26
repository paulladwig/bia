class RestaurantsController < ApplicationController

  def index
    @restaurants = policy_scope(Restaurant)
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
