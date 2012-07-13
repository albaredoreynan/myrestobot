class RemoveDeletedAtFromSaleCategories < ActiveRecord::Migration
  def change
    remove_column :sale_categories, :deleted_at
  end
end
