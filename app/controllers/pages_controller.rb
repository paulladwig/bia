require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
    search_query = search_params[:query]
    longitude = search_params[:long]
    latitude = search_params[:lat]
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=5000&type=restaurant&keyword=#{search_query}&key=AIzaSyCPC7sOhoLMUcN4yj0XIlqvjC6uG0KGk24"
    json_sereialized = JSON.parse(open(url).read)
    @found_results = []
    json_sereialized["results"].each do |result|
      @found_results << [result["name"], result["vicinity"]]
    end
  end

  private

  def search_params
    params.require(:search).permit(:query, :lat, :long)
  end
end
