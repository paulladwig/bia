class AddExternalPhotoToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :external_photo, :string
  end
end
