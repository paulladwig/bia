class UsersController < ApplicationController
  def show
    @restaurants = policy_scope(Restaurant)
    @user = current_user
    authorize @user
  end
end
