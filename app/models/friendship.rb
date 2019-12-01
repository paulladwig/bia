class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  paginates_per 25
  # validates :asker, uniqueness: { scope: :receiver}
  validates :receiver, uniqueness: { scope: :asker }
end
