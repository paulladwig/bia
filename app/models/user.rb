class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :selections
  has_many :restaurants, through: :selections
  has_many :friendships_as_asker, source: :friendships, foreign_key: :asker_id
  has_many :friendships_as_receiver, source: :friendships, foreign_key: :receiver_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
