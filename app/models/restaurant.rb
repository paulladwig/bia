class Restaurant < ApplicationRecord
  has_many :selections
  has_many :users, through: :selections

  mount_uploader :photo, PhotoUploader

  def calc_avg_occassion
    all_selections = self.selections.where(recommended: true)
    all_occassions = 0
    all_selections.each do |selection|
      all_occassions += selection.occasion
    end
    self.avg_occasion = all_occassions / all_selections.length
    self.save
  end

  def calc_avg_price
    all_selections = self.selections.where(recommended: true)
    all_prices = 0
    all_selections.each do |selection|
      all_prices += selection.price
    end
    self.avg_price = all_prices / all_selections.length
    self.save
  end
end
