class Restaurant < ApplicationRecord
  searchkick word_middle: [:cuisine, :name]
  scope :search_import, -> { includes(:selections) }
  has_many :selections
  has_many :users, through: :selections
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  def search_data
    { name: name,
      cuisine: cuisine
    }
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
      if !selection.occasion.nil?
        all_prices += selection.price
      end
    end
    self.avg_price = all_prices / all_selections.length
    self.save
  end
end
