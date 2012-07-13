class RemoveEntryDateTimeFromEndcounts < ActiveRecord::Migration
  def change
    remove_column :endcounts, :entry_date_time
  end
end
