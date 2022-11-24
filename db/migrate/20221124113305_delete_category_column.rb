class DeleteCategoryColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :category
  end
end
