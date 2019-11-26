class RestaurantsController < ApplicationController

  def index

  end
  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
