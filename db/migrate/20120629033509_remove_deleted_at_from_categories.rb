class RemoveDeletedAtFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :deleted_at
  end
end
