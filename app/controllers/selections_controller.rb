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

  # def update
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @update_selection = Selection.where(restaurant: @restaurant, user_id: current_user.id)
  #   @update_selection.first.update(params)
  #   authorize @update_selection
  #   redirect_to restaurant_path(@restaurant)
  # end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @delete_entry = Selection.where(restaurant: @restaurant, user_id: current_user.id)
    @delete_entry.first.destroy
    authorize @delete_entry
    redirect_to restaurant_path(@restaurant)
  end

  private

  def update_bookmark(entry)
    entry.bookmarked = entry.bookmarked ? false : true
    entry.save
  end

  def bookmark(restaurant, entry)
    @selection = Selection.new(user: current_user, bookmarked: true, restaurant: restaurant)
    if @selection.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(restaurant) }
        format.js
      end
    else
      update_bookmark(entry)
      respond_to do |format|
        format.html { redirect_to restaurant_path(restaurant) }
        format.js
      end
    end
    authorize @selection
  end

  def update_selection(entry, params, recomm)
    @recomm = recomm
    @selection = entry
    @selection.update(bookmarked: false)
    @selection.recommended = true
    p params
    if @selection.update(params)
      p 'success updating'
      @outcome = "success"
    else
      entry.recommended = false
      @new_selection = Selection.new(recommendation_params)
      @new_selection.restaurant = entry.restaurant
      @new_selection.user = current_user
      @outcome = "failure"
      p 'failure updating'
    end
    respond_to do |format|
      format.html { redirect_to restaurant_path(restaurant) }
      format.js
    end
  end

  def create_recommendation(params, restaurant, recomm)
    @recomm = recomm
    @selection = Selection.new(user: current_user, recommended: true, restaurant: restaurant)
    @recommendation_params = recommendation_params
    if @selection.update(recommendation_params)
      @outcome = "success"
      p 'success creating'
    else
      @selection.recommended = false
      @outcome = "failure"
      @review = recommendation_params[:review]
      @cuisine = recommendation_params[:cuisine]
      p 'failure creating'
    end
    respond_to do |format|
      format.html { redirect_to restaurant_path(restaurant) }
      format.js
    end
  end

  def recommend(params, restaurant, entry)
    @recomm = recommendation_param[:recommendation]
    @recommendation_params = recommendation_params
    if entry.nil?
      p 'no entry'
      create_recommendation(params, restaurant, @recomm)
    else
      p ' entry'
      update_selection(entry, params, @recomm)
    end
    authorize @selection
  end

  def recommendation_params
    params.require(:selection).permit(:review, :occasion, :price, :special, :cuisine)
  end

  def recommendation_param
    params.require(:selection).permit(:recommendation)
  end
end
