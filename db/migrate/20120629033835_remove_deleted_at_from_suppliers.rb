class RemoveDeletedAtFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :deleted_at
  end
end
