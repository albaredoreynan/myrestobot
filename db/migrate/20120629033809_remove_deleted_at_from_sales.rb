class RemoveDeletedAtFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :deleted_at
  end
end
