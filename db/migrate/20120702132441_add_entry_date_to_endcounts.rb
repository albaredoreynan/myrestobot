class AddEntryDateToEndcounts < ActiveRecord::Migration
  def change
    add_column :endcounts, :entry_date, :date
  end
end
