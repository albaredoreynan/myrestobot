class RemoveDeletedAtFromItemCounts < ActiveRecord::Migration
  def change
    remove_column :item_counts, :deleted_at
  end
end
