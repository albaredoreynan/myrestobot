class RemoveDeletedAtFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :deleted_at
  end
end
