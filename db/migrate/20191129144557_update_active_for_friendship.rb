class UpdateActiveForFriendship < ActiveRecord::Migration[5.2]
  def change
    change_column_default :friendships, :active, 1
  end
end
