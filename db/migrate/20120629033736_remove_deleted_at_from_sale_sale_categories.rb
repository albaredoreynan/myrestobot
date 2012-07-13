class RemoveDeletedAtFromSaleSaleCategories < ActiveRecord::Migration
  def change
    remove_column :sale_sale_categories, :deleted_at
  end
end
