class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.integer :bigger_unit_id
      t.integer :smaller_unit_id
      t.float :conversion_factor
      
      t.timestamps
    end
    
    add_index :conversions, :bigger_unit_id
    add_index :conversions, :smaller_unit_id
  end
end
