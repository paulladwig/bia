class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.boolean :shared
      t.datetime :proposed_time
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
