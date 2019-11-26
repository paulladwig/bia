class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
