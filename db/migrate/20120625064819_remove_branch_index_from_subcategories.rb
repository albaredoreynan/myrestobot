class RemoveBranchIndexFromSubcategories < ActiveRecord::Migration
  def change
    remove_index :subcategories, :branch_id
    remove_column :subcategories, :branch_id
  end
end
