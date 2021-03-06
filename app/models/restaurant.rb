class Restaurant < ApplicationRecord
  searchkick word_middle: [:cuisine, :name, :recommended], locations: [:location], suggest: [:name, :cuisine, :recommended]
  scope :search_import, -> { includes(:selections, :users) }
  has_many :selections, dependent: :destroy
  has_many :users, through: :selections
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :shares, dependent: :destroy
  has_many :users_sharing, through: :shares, foreign_key: :user_id

  mount_uploader :photo, PhotoUploader

  CUISINES = ['Italian', 'Asian-inspired', 'Vietnamese', 'German', 'Pizza', 'Fast Food',
  'Breakfast & Brunch', "Pan Asian", "Kebab", "Burgers", "Sushi Bars", "Mediterranean", "Indian", "Turkish",
  "Chinese", "Bakeries", "Coffee & Tea", "Thai", "Middle Eastern", "Greek", "Steak", "French",
  "Patisserie / Cake Shop", "Vegan", "Sandwiches", "Modern European", "Ice Cream & Frozen Yogurt", "Korean",
  "Mexican", "Japanese", "Arabian", "Salad", "Vegetarian", "Barbeque", "Falafel", "Spanish", "Lebanese",
  "Austrian", "Seafood", "Soup", "Tapas", "American", "Buffets", "Creperies", "Waffles", "Asian Fusion", "Russian",
  "Argentine", "Latin American", "Wine Bars", "Cajun" , "Caribbean", "Moroccan", "Swedish", "Latvian", "Scottish",
  "British", "Russian", "Jewish", "Canadian", "Polish", "Hawaiian", "Brazilian", "Peruvian", "Salvadorian",
  "Cuban", "Tibetan", "Egyptian", "Belgian", "Irish", "Welsh", "Mormon", "Portuguese", "Haitian",
  "Tahitian", "Kenyan", "Algerian", "Nigerian", "Libyan", "Syrian"]

  def search_data
    { name: name,
      cuisine: cuisine,
      recommended: "#{users.map(&:name).join(' ')}",
      price: avg_price,
      occasion: avg_occasion,
      popularity: self.selections.count
    }.merge(location: {lat: latitude, lon: longitude})
  end

  def get_friends_recommended(user)
    selections = self.selections.where(recommended: true)
    selections.where(user: User.following(user, "instance"))
  end

  def self.relevant_restaurants(user, type)
    Restaurant.reciever_restaurants(user, type) + Restaurant.user_restaurants(user, type)
  end

  def self.reciever_restaurants(user, type)
    receivers = User.following(user, "instance")
    all_selections = []
    restaurants = []
    receivers.each { |receiver| all_selections << receiver.selections }
    all_selections.each do |user_selections|
      user_selections.each do |selection|
        restaurants << selection.restaurant if selection.recommended == true
      end
    end
    Restaurant.type_conversion(restaurants, type)
  end

  def self.user_restaurants(user, type)
    Restaurant.user_restaurants_recommended(user, type) + Restaurant.user_restaurants_bookmarked(user, type)
  end

  def self.user_restaurants_recommended(user, type)
    restaurants = []
    user.selections.each do |selection|
      restaurants << selection.restaurant if selection.recommended == true
    end
    Restaurant.type_conversion(restaurants, type)
  end

  def self.user_restaurants_bookmarked(user, type)
    restaurants = []
    user.selections.each do |selection|
      restaurants << selection.restaurant if selection.bookmarked == true
    end
    Restaurant.type_conversion(restaurants, type)
  end

  def calc_avg_occassion
    all_selections = self.selections.where(recommended: true)
    all_occassions = 0
    all_selections.each do |selection|
      if !selection.occasion.nil?
        all_occassions += selection.occasion
      end
    end
    self.avg_occasion = (all_occassions.to_f / all_selections.length).round
    self.save
  end

  def calc_avg_price
    p self.name
    all_selections = self.selections.where(recommended: true)
    all_prices = 0
    all_selections.each do |selection|
      if !selection.price.nil?
        p all_prices += selection.price
      end
    end
    self.avg_price = (all_prices.to_f / all_selections.length).round
    p self.avg_price
    self.save
  end

  def calc_most_common_cuisine
    self.name
    count_by_cuisine = self.selections.group(:cuisine).count
    count_by_cuisine
    highest_value = count_by_cuisine.max_by{|k,v| v}[1]
    highest_value
    cuisines = count_by_cuisine.select { |key, value| value == highest_value }.keys
    cuisines
    cuisine_tag = ''
    cuisines.each do |cuisine|
      if !cuisine.nil? && cuisine != ""
        cuisine_tag += "#{cuisine}, "
      end
    end
    self.cuisine = cuisine_tag.chomp(", ")
    self.save
  end

  private

  def self.type_conversion(restaurants, type)
    if type == "id"
      return restaurants.map!{ |restaurant| restaurant.id }
    elsif type == "instance"
      return restaurants
    end
  end
end
