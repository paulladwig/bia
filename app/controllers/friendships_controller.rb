class FriendshipsController < ApplicationController
  def index_following
    @friendships = policy_scope(Friendship).where(asker: current_user)
    authorize @friendships
  end

  def index_followers
    @friendships = policy_scope(Friendship).where(receiver: current_user)
    authorize @friendships
  end
end
