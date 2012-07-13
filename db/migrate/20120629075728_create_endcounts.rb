class CreateEndcounts < ActiveRecord::Migration
  def change
    create_table :endcounts do |t|
      t.datetime :entry_date_time
      t.integer :branch_id
      
      t.timestamps
    end
    
    add_index :endcounts, :branch_id
  end
end
