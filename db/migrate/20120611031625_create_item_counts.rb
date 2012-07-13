class CreateItemCounts < ActiveRecord::Migration
  def change
    create_table :item_counts do |t|
      t.integer :item_id
      t.integer :unit_id
      t.integer :branch_id
      t.integer :concept_id
      t.integer :client_id
      
      t.date :entry_date
      t.float :stock_count
      t.timestamps
    end
    
    add_index :item_counts, :item_id
    add_index :item_counts, :unit_id
    add_index :item_counts, :client_id
    add_index :item_counts, :concept_id
    add_index :item_counts, :branch_id
  end
end
