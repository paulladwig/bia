class AddMenuToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :menu, :string
  end
end
