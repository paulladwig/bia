class AddCuisineToSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :selections, :cuisine, :string
  end
end
