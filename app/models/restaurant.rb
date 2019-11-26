class Restaurant < ApplicationRecord
  has_many :selections
  has_many :users, through: :selections

  mount_uploader :photo, PhotoUploader
end
