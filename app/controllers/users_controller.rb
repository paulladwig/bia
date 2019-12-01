class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @friendship = Friendship.where(asker_id: current_user.id, receiver_id: @user.id).first
    query = "*"
    options = {fields: ["name^10", "cuisine^2"], per_page: 24, page: params[:page], where: {id: Restaurant.user_restaurants(current_user, "id")}}
    @own_restaurants = policy_scope(Restaurant).search(query, options)
    @current_page = @own_restaurants.current_page
    @total_pages = @own_restaurants.total_pages
  end
end
