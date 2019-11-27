class SelectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user.receivers)
    end

    def index
      true
    end
  end
end
