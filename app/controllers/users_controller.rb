class UsersController < ApplicationController
  def show
    #if friendship exists
    @restaurants = policy_scope(Restaurant)
    @user = User.find(params[:id])
    authorize @user
    @friendship = Friendship.where(asker_id: current_user.id, receiver_id: @user.id).first
    @own_restaurants = @user.restaurants.page(params[:page]).per(24)
    @current_page = @own_restaurants.current_page
    @total_pages = @own_restaurants.total_pages
  end
end
