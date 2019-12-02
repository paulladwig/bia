class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @friendship = Friendship.where(asker_id: current_user.id, receiver_id: @user.id).first
    query = "*"
    options = {fields: ["name"], per_page: 24, page: params[:page], where: {id: Restaurant.user_restaurants(current_user, "id")}}
    @own_restaurants = policy_scope(Restaurant).search(query, options)
    @current_page = @own_restaurants.current_page
    @total_pages = @own_restaurants.total_pages
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
    params.require(:search).permit(:query)
  end

end
