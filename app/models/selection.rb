class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  after_save :update_averages, if: :recommended?

  validates :user_id, uniqueness: { :scope => :restaurant_id }

  def update_averages
    self.restaurant.calc_avg_occassion
    self.restaurant.calc_avg_price
  end
end
