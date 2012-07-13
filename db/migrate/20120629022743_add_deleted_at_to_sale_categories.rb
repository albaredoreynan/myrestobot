class AddDeletedAtToSaleCategories < ActiveRecord::Migration
  def change
    add_column :sale_categories, :deleted_at, :datetime
  end
end
