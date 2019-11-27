class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @selection = Selection.new(user: current_user, bookmarked: true, restaurant: @restaurant)
    @selection.save
    authorize @selection
  end

  private


end
