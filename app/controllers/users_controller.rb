class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @friendship = Friendship.where(asker_id: current_user.id, receiver_id: @user.id).first
    query = "*"
    options = {fields: ["name"], per_page: 24, page: params[:page]}
    if show_params[:selection] == "bookmarked"
      options[:where] = {id: Restaurant.user_restaurants_bookmarked(@user, "id")}
    elsif show_params[:selection] == "recommended"
      options[:where] = {id: Restaurant.user_restaurants_recommended(@user, "id")}
    else
      options[:where] = {id: Restaurant.user_restaurants(@user, "id")}
    end
    @own_restaurants = policy_scope(Restaurant).search(query, options)
    @current_page = @own_restaurants.current_page
    @total_pages = @own_restaurants.total_pages
    respond_to do |format|
      format.html { render 'show' }
      format.js
    end
  end

  def index
    params[:search].presence ? query = search_params[:query] : query = "*"
    options = {fields: [:friendname, "username^2", :email], per_page: 24, operator: "or", match: :word_middle, page: params[:page]}
    options[:where] = where
    @users = policy_scope(User).search(query, options)
  end

  private

  def where
    where = {}

    if params[:search].nil?
      following = User.following(current_user, "id")
      followers = User.followers(current_user, "id")
      where[:id] = following + followers
    end

    where
  end

  def search_params
    params.require(:search).permit(:query, :selection)
  end

  def show_params
    params.permit(:selection)
  end

end
