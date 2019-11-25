class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :cuisine
      t.integer :avg_price
      t.integer :avg_occasion
      t.string :url
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
