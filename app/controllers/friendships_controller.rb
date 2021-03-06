class FriendshipsController < ApplicationController

  # ========this is not needed anymore keep just in case for now delete later

  # def index_following
  #   @user = User.find(params[:id])
  #   authorize @user
  #   @friendships = Friendship.where(asker: @user, active: 1).page(params[:page])
  #   @current_page = @friendships.current_page
  #   @total_pages = @friendships.total_pages
  # end

  # def index_followers
  #   @user = User.find(params[:id])
  #   authorize @user
  #   @friendships = Friendship.where(receiver: @user, active: 1).page(params[:page])
  #   @current_page = @friendships.current_page
  #   @total_pages = @friendships.total_pages
  # end

  def create
    @user = User.find(params[:id])
    @friendship = Friendship.new(receiver: @user, asker: current_user)
    authorize @friendship
    @friendship.save!
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    @receiver = @friendship.receiver
    @friendship.update(active: params[:active])
    respond_to do |format|
      format.html { redirect_to user_path(@receiver) }
      format.js
    end
  end
end
