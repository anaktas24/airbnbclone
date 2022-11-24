class AddCategoryToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :category, :string
  end
end
