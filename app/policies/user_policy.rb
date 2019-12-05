class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def profile?
    true
  end

  def index_following?
    true
  end

  def index_followers?
    true
  end
end
