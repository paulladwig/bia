class Restaurant < ApplicationRecord
  searchkick word_middle: [:cuisine, :name, :recommended], locations: [:location], suggest: [:name, :cuisine, :recommended]
  scope :search_import, -> { includes(:selections, :users) }
  has_many :selections
  has_many :users, through: :selections
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  CUISINES = ['Italian', 'Asian-inspired', 'Vietnamese', 'German', 'Pizza', 'Fast Food',
  'Breakfast & Brunch', "Pan Asian", "Kebab", "Burgers", "Sushi Bars", "Mediterranean", "Indian", "Turkish",
  "Chinese", "Bakeries", "Coffee & Tea", "Thai", "Middle Eastern", "Greek", "Steakhouses", "French",
  "Patisserie / Cake Shop", "Vegan", "Sandwiches", "Modern European", "Ice Cream & Frozen Yogurt", "Korean",
  "Mexican", "Japanese", "Arabian", "Salad", "Vegetarian", "Barbeque", "Falafel", "Spanish", "Lebanese",
  "Austrian", "Seafood", "Soup", "Tapas", "American", "Buffets", "Creperies", "Waffles", "Asian Fusion", "Russian",
  "Argentine", "Latin American", "Wine Bars", "Cajun" , "Caribbean", "Moroccan", "Swedish", "Latvian", "Scottish",
  "British", "Russian", "Jewish", "Canadian", "Polish", "Hawaiian", "Brazilian", "Peruvian", "Salvadorian",
  "Cuban", "Tibetan", "Egyptian", "Belgian", "Irish", "Welsh", "Mormon", "Portuguese", "Haitian",
  "Tahitian", "Kenyan", "Algerian", "Nigerian", "Libyan"]

  def search_data
    { name: name,
      cuisine: cuisine,
      recommended: "#{users.map(&:name).join(' ')}"
    }.merge(location: {lat: latitude, lon: longitude})
  end

  def get_friends_recommended(current_user)
    selections = self.selections.where(recommended: true)
    selections.where(user: current_user.receivers)
  end

  def self.relevant_restaurants(current_user)
    Restaurant.reciever_restaurants(current_user) + Restaurant.user_restaurants(current_user)
  end

  def self.reciever_restaurants(current_user)
    receivers = current_user.receivers
    all_selections = []
    restaurants = []
    receivers.each { |receiver| all_selections << receiver.selections }
    all_selections.each do |user_selections|
      user_selections.each do |selection|
        restaurants << selection.restaurant if selection.recommended == true
      end
    end
    restaurants.map!{ |restaurant| restaurant.id }
  end

  def self.user_restaurants(current_user)
    restaurants = []
    current_user.selections.each do |selection|
      restaurants << selection.restaurant if selection.recommended == true || selection.bookmarked == true
    end
    restaurants.map!{ |restaurant| restaurant.id }
  end

  def calc_avg_occassion
    all_selections = self.selections.where(recommended: true)
    all_occassions = 0
    all_selections.each do |selection|
      if !selection.occasion.nil?
        all_occassions += selection.occasion
      end
    end
    self.avg_occasion = all_occassions / all_selections.length
    self.save
  end

  def calc_avg_price
    all_selections = self.selections.where(recommended: true)
    all_prices = 0
    all_selections.each do |selection|
      if !selection.price.nil?
        all_prices += selection.price
      end
    end
    self.avg_price = all_prices / all_selections.length
    self.save
  end
end
