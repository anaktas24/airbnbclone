class ChangeCategoryType < ActiveRecord::Migration[7.0]
  # enable_extension "plpsql"
  create_enum "category", ["Electronic", "Manual", "Gas-powered", "Other"]
  def change
    add_column :listings, :category_type, :enum, null: false, enum_type: "category", default: "Other"
  end
end
