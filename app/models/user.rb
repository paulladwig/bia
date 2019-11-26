class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :selections
  has_many :friendships_as_asker, source: :friendships, foreign_key: :asker_id, class_name: "Friendship"
  has_many :friendships_as_receiver, source: :friendships, foreign_key: :receiver_id, class_name: "Friendship"
  has_many :receivers, through: :friendships_as_asker
  has_many :askers, through: :friendships_as_receiver

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
