class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :symbol
      t.string :unit_type
      t.integer :branch_id
      t.integer :concept_id
      t.integer :client_id
      
      t.timestamps
    end
    
    add_index :units, :concept_id
    add_index :units, :client_id
    add_index :units, :branch_id
    add_index :items, :unit_id
  end
end
