class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      
      t.integer :subcategory_id
      t.integer :unit_id
      t.integer :branch_id
      t.integer :concept_id
      t.integer :client_id
      
      t.timestamps
    end
    
    add_index :items, :subcategory_id
    add_index :items, :concept_id
    add_index :items, :client_id
    add_index :items, :branch_id
  end
end
