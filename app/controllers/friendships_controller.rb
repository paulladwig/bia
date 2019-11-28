class FriendshipsController < ApplicationController
  def index_following
    @user = User.find(params[:id])
    authorize @user
    @friendships = Friendship.where(asker: @user)
  end

  def index_followers
    @user = User.find(params[:id])
    authorize @user
    @friendships = Friendship.where(receiver: @user)
  end
end
