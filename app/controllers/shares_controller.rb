class SharesController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @share = Share.create(user: current_user, restaurant: @restaurant)
    authorize @share
  end
end
