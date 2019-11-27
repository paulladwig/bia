class SelectionsController < ApplicationController
  def index
    @selections = policy_scope(Selection)
  end
end
