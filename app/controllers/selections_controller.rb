class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection).where(user: User.following(current_user, "instance"))
    @friendships = current_user.friendships_as_receiver
    combined_activities = @selections + @friendships
    @all_activities = Kaminari.paginate_array(combined_activities.sort_by { |activity| activity.updated_at }.reverse_each.to_a).page(params[:page]).per(15)
    @current_page = @all_activities.current_page
    @total_pages = @all_activities.total_pages
    @feature = [feature, feature, feature]
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

  def update_selection(entry, params)
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

  def create_recommendation(params, restaurant)
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
    @recommendation_params = recommendation_params
    if entry.nil?
      p 'no entry'
      create_recommendation(params, restaurant)
    else
      p ' entry'
      update_selection(entry, params)
    end
    authorize @selection
  end

  def feature
    feature_result = {}
    while feature_result == {} || feature_result[:restaurants].count <= 2
      restaurant_start = Restaurant.relevant_restaurants(current_user, "instance").sample
      # add most selected type

      type = ["cuisine", "price", "occasion"].sample
      options = {limit: 3, boost_by: [:popularity]}
      where = {id: Restaurant.relevant_restaurants(current_user, "id")}
      feature_result[:type] = type
      if type == "cuisine"
        where[:cuisine] = restaurant_start.cuisine
        feature_result[:value] = restaurant_start.cuisine
        feature_result[:title] = ["Try something new, #{restaurant_start.cuisine}","Have you tried #{restaurant_start.cuisine}"].sample
        feature_result[:link] = {"query"=>"", "location"=>"", "range"=>"", "lat"=>"na", "long"=>"na", "cuisine"=>["","#{restaurant_start.cuisine}"], "occasion"=>[""], "price"=>[""]}
      elsif type == "price"
        where[:price] = restaurant_start.avg_price
        feature_result[:value] = restaurant_start.avg_price
        if restaurant_start.avg_price == 1
          price_titel = ["Favourite Cheap Eats", "Save Money at These Restaurants", "Meal on a Budget"]
        elsif restaurant_start.avg_price == 2
          price_titel = ["Outstanding Food for a Fair Price", "Exceptional Value for Money", "This Could Be Your New Favourite"]
        elsif restaurant_start.avg_price == 3
          price_titel = ["Time to Treat Yourself!"]
        elsif restaurant_start.avg_price == 4
          price_titel = ["After Payday", "It's Time For The Occasional Splurge!"]
        end
        feature_result[:title] = price_titel.sample
        feature_result[:link] = {"query"=>"", "location"=>"", "range"=>"", "lat"=>"na", "long"=>"na", "cuisine"=>[""], "occasion"=>[""], "price"=>["","#{restaurant_start.avg_price}"]}
      elsif type == "occasion"
        where[:occasion] = restaurant_start.avg_occasion
        feature_result[:value] = restaurant_start.avg_occasion
        if restaurant_start.avg_price == 1
          occasion_titel = ["When you're on the go", "Quick Bites"]
        elsif restaurant_start.avg_price == 2
          occasion_titel = ["Perfect for a Casual Dine", "Casual Restaurants you Should Try"]
        elsif restaurant_start.avg_price == 3
          occasion_titel = ["For the Weekend"]
        elsif restaurant_start.avg_price == 4
          occasion_titel = ["Time to Celebrate", "For a Special Occassion"]
        end
        feature_result[:link] = {"query"=>"", "location"=>"", "range"=>"", "lat"=>"na", "long"=>"na", "cuisine"=>[""], "occasion"=>["","#{restaurant_start.avg_occasion}"], "price"=>[""]}
        feature_result[:title] = occasion_titel.sample
      # elsif type == "user"
      end
      options[:where] = where
      feature_result[:restaurants] = policy_scope(Restaurant).search("*", options)
    end
    feature_result
  end

  def recommendation_params
    params.require(:selection).permit(:review, :occasion, :price, :special, :cuisine)
  end

  def recommendation_param
    params.require(:selection).permit(:recommendation)
  end
end
