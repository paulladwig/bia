class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(receiver: user).or(scope.where(asker: user))
    end
  end

  def index_followers?
    true
  end

  def index_following?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
