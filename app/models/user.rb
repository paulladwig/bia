class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  searchkick word_middle: [:name, :username, :email]
  mount_uploader :photo, PhotoUploader
  has_many :selections
  has_many :friendships_as_asker, source: :friendships, foreign_key: :asker_id, class_name: "Friendship"
  has_many :friendships_as_receiver, source: :friendships, foreign_key: :receiver_id, class_name: "Friendship"
  has_many :receivers, through: :friendships_as_asker
  has_many :askers, through: :friendships_as_receiver
  has_many :restaurants, through: :selections

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def search_data
    { friendname: name,
      username: username,
      recommended: email
    }
  end

#CHECK IF THIS NEEDS TO BE MODIFIED WITH ACTIVE STATUS OR IF THE FUNCTION IS EVEN USED!
  def friends?(other_user)
    if Friendship.where("asker_id  = #{self.id} AND receiver_id = #{other_user.id}") != []
      return true
    else
      return false
    end
  end
end
