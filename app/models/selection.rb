class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  after_save :update_averages, if: :recommended?

  validates :user_id, uniqueness: { :scope => :restaurant_id }
  # validates :review, presence: true, if: :recommended?, length: { in: 50..1500 }
  # validates :cuisine, presence: true, if: :recommended?, inclusion: { in: Restaurant::CUISINES,
    # message: "Please select from the list" }

  def update_averages
    self.restaurant.calc_avg_occassion
    self.restaurant.calc_avg_price
    self.restaurant.calc_most_common_cuisine
  end

  def recommended?
    self.recommended == true
  end
end
