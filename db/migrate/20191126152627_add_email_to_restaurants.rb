class AddEmailToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :email, :string
  end
end
