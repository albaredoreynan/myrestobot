class RemoveDeletedAtFromSubcategories < ActiveRecord::Migration
  def change
    remove_column :subcategories, :deleted_at
  end
end
