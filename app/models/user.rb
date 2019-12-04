class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  searchkick word_middle: [:name, :username, :email]
  mount_uploader :photo, PhotoUploader
  has_many :selections, dependent: :destroy
  has_many :friendships_as_asker, source: :friendships, foreign_key: :asker_id, class_name: "Friendship"
  has_many :friendships_as_receiver, source: :friendships, foreign_key: :receiver_id, class_name: "Friendship"
  has_many :receivers, through: :friendships_as_asker
  has_many :askers, through: :friendships_as_receiver
  has_many :restaurants, through: :selections
  has_many :shares, dependent: :destroy
  has_many :restaurants_as_sharer, through: :shares, source: :restaurant

  validates :name, presence: true, format: { with: /\A([a-zA-Z]|\d|\s)+\z/,
    message: "only allows standard English letters and numbers" }
  validates :username, presence: true, format: { with: /\A\w+\z/,
    message: "only allows standard English letters, numbers and underscores" }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def search_data
    { friendname: name,
      username: username,
      email: email
    }
  end

  def self.followers(user, type)
    followers = []
    Friendship.where(receiver: user, active: 1).each do |friendship|
      followers << friendship.asker
    end
    User.type_conversion(followers, type)
  end

  def self.following(user, type)
    following = []
    Friendship.where(asker: user, active: 1).each do |friendship|
      following << friendship.receiver
    end
    User.type_conversion(following, type)
  end

#CHECK IF THIS NEEDS TO BE MODIFIED WITH ACTIVE STATUS OR IF THE FUNCTION IS EVEN USED!
  def friends?(other_user)
    if Friendship.where("asker_id  = #{self.id} AND receiver_id = #{other_user.id}") != []
      return true
    else
      return false
    end
  end

  private

  def self.type_conversion(users, type)
    if type == "id"
      return users.map!{ |user| user.id }
    elsif type == "instance"
      return users
    end
  end
end
