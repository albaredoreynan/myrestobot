class RemoveDeletedAtFromBranches < ActiveRecord::Migration
  def change
    remove_column :branches, :deleted_at
  end
end
