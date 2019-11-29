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

  def create
    @user = User.find(params[:id])
    @friendship = Friendship.new(receiver: @user, asker: current_user)
    @friendship.save!
    authorize @friendship
  end

  def destroy
    raise
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    @receiver = @friendship.receiver
    @friendship.destroy!
    redirect_to user_path(@receiver)
  end
end
