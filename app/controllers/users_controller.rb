class UsersController < ApplicationController
  def show
    #if friendship exists
    @restaurants = policy_scope(Restaurant)
    @user = User.find(params[:id])
    authorize @user
    @friendship = Friendship.where(asker_id: current_user.id, receiver_id: @user.id).first
    @own_restaurants = @user.restaurants
  end
end
