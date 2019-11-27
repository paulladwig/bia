class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection).where(user: current_user.receivers)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @selection = Selection.new(user: current_user, bookmarked: true, restaurant: @restaurant)
    if @selection.save
      redirect_to restaurant_path(@restaurant)
    else
      update_recommended(@restaurant)
      redirect_to restaurant_path(@restaurant)
    end
    authorize @selection
  end

  private

  def update_recommended(restaurant)
    @selection_update = Selection.find_by(user: current_user, restaurant: restaurant)
    if @selection_update.bookmarked
      @selection_update.bookmarked = false
    elsif !@selection_update.bookmarked
      @selection_update.bookmarked = true
    end
    @selection_update.save
  end

end
