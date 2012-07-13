class AddDeletedAtToItemCounts < ActiveRecord::Migration
  def change
    add_column :item_counts, :deleted_at, :datetime
  end
end
