class AddActiveToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :active, :integer
  end
end
