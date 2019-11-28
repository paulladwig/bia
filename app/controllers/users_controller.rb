class UsersController < ApplicationController
  def show
    @restaurants = policy_scope(Restaurant)
    @user = User.find(params[:id])
    authorize @user
    @own_restaurants = @user.restaurants
  end
end
