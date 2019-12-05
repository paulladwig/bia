require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # if current_user
    #   redirect_to discover_path
    # end
  end

  def contact
    if params[:type] == "feedback"
      @title = "feedback"
    elsif params[:type] == "support"
      @title = "feedback"
    else
    end
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def cookies
  end
end
