class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection).where(user: User.following(current_user, "instance"))
    @friendships = current_user.friendships_as_receiver
    combined_activities = @selections + @friendships
    @all_activities = Kaminari.paginate_array(combined_activities.sort_by { |activity| activity.updated_at }.reverse_each.to_a).page(params[:page]).per(15)
    @current_page = @all_activities.current_page
    @total_pages = @all_activities.total_pages
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
    @selection.update(params)
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
