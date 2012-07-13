class AddDeletedAtToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :deleted_at, :datetime
  end
end
