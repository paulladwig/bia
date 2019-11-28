class AddPlaceidToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :placeid, :string
  end
end
