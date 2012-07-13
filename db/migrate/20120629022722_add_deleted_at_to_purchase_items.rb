class AddDeletedAtToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :deleted_at, :datetime
  end
end
