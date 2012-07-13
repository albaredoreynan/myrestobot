class AddDeletedAtToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :deleted_at, :datetime
  end
end
