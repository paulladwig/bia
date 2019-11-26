class Restaurant < ApplicationRecord
  searchkick word_middle: [:cuisine, :name]
  scope :search_import, -> { includes(:selections) }
  has_many :selections
  has_many :users, through: :selections

  mount_uploader :photo, PhotoUploader

  def search_data
    { name: name,
      cuisine: cuisine
    }
  end
end
