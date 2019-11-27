class SelectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user.receivers).or(scope.where(user: user))
    end
  end

  def create?
    true
  end
end
