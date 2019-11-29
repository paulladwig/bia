class RestaurantsController < ApplicationController
  def index
    params[:search].presence ? query = params[:search][:query] : query = "*"
    options = {fields: ["name^10", :cuisine, :recommended], operator: "or", match: :word_middle, where: {_or: [{id: current_user.restaurants.ids}, {id: reciever_restaurants}]}}
    @restaurants = policy_scope(Restaurant).search(query, options)
    @current_user = current_user
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @new_recommendation = Selection.new
    @markers = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }
    @reviews = Selection.where(user: current_user, restaurant: @restaurant).or(Selection.where(user: current_user.receivers, restaurant: @restaurant))
  end

  private
  def reciever_restaurants
    receivers = current_user.receivers
    all_selections = []
    restaurants = []
    receivers.each { |receiver| all_selections << receiver.selections }
    all_selections.each do |user_selections|
      current_restaurants = []
      user_selections.each do |selection|
        if selection.recommended == true
          restaurants << selection.restaurant
        end
      end
    end
    restaurants.map! { |restaurant| restaurant.id}
  end

end
