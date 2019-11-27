class UsersController < ApplicationController
  def show
    @restaurants = policy_scope(Restaurant)
    @user = current_user
    authorize @user
    @own_restaurants = current_user.restaurants
  end
end
