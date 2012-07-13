class RemoveBranchIndexFromCategories < ActiveRecord::Migration
  def change
    remove_index :categories, :branch_id
    remove_column :categories, :branch_id
  end
end
