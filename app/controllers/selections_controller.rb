class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection).where(user: current_user.receivers)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    existing_entry = Selection.find_by(user: current_user, restaurant: @restaurant) # Exist: nil if there is no selection, selection if selection exists
    # Create or edit bookmarks
    if !params[:bookmark].nil?
      bookmark(@restaurant, existing_entry)
    elsif params[:selection][:recommendation] == 'true'
      recommend(recommendation_params, @restaurant, existing_entry)
    end
    authorize @selection
  end

  private

  def update_bookmark(entry)
    entry.bookmarked = entry.bookmarked ? false : true
    entry.save
  end

  def bookmark(restaurant, entry)
    @selection = Selection.new(user: current_user, bookmarked: true, restaurant: restaurant)
    if @selection.save
      redirect_to restaurant_path(restaurant)
    else
      update_bookmark(entry)
      redirect_to restaurant_path(restaurant)
    end
      authorize @selection
  end

  def update_selection(entry, params)
    entry.update(bookmarked: false, recommended: true)
    entry.update(params)
  end

  def recommend(params, restaurant, entry)
    @selection = Selection.new(user: current_user, recommended: true, restaurant: restaurant)
    if @selection.save
      redirect_to restaurant_path(restaurant)
    else
      update_selection(entry, params)
      redirect_to restaurant_path(restaurant)
    end
    authorize @selection
  end

  def recommendation_params
    params.require(:selection).permit(:review, :occasion, :price, :special)
  end
end
