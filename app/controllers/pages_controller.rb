require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      redirect_to discover_path
    end
  end

  # def geocoder
  #   coordinates = {params[:lat], params[:long]}
  #   address =  geocoder coordinates

  #   render json: {
  #     address: address
  #   }, status: :ok
  # end

  #  def search
  #   search_query = search_params[:query]
  #   longitude = search_params[:long]
  #   latitude = search_params[:lat]
  #   url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=5000&type=restaurant&keyword=#{search_query}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
  #   json_sereialized = JSON.parse(open(url).read)
  #   @found_results = []
  #   json_sereialized["results"].each do |result|
  #     @found_results << [result["name"], result["vicinity"]]
  #   end
  #   params[:search].presence ? query = params[:search][:query] : query = "*"
  #   options = {fields: [:name, :cuisine, :recommended, :friendname, :username, :email], operator: "or", match: :word_middle}
  #   @your_restaurants = policy_scope(Restaurant).search(search_query, options)
  #   @your_users = policy_scope(User).search(search_query, options)
  # end

  # private

  # def search_params
  #   params.require(:search).permit(:query, :lat, :long)
  # end
end
