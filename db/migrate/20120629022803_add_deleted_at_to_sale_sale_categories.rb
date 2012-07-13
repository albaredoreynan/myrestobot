class AddDeletedAtToSaleSaleCategories < ActiveRecord::Migration
  def change
    add_column :sale_sale_categories, :deleted_at, :datetime
  end
end
