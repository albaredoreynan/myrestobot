class RemoveDeletedAtFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :deleted_at
  end
end
