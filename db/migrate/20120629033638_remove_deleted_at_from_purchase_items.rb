class RemoveDeletedAtFromPurchaseItems < ActiveRecord::Migration
  def change
    remove_column :purchase_items, :deleted_at
  end
end
