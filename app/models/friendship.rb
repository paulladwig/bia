class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  # validates :asker, uniqueness: { scope: :receiver}
  validates :receiver, uniqueness: { scope: :asker }
end
