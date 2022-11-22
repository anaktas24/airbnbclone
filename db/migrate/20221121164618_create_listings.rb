class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_hour
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
