class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :occasion
      t.integer :price
      t.boolean :special
      t.text :review
      t.datetime :proposed_date
      t.boolean :bookmarked
      t.boolean :recommended
      t.boolean :shared
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
