class AddEndcountIndexToItemCounts < ActiveRecord::Migration
  def change
    add_column :item_counts, :endcount_id, :integer
    add_index :item_counts, :endcount_id
  end
end
