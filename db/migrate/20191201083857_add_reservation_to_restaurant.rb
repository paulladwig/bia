class AddReservationToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :reservation, :string
  end
end
