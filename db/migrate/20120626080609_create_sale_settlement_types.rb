class CreateSaleSettlementTypes < ActiveRecord::Migration
  def change
    create_table :sale_settlement_types do |t|
      t.integer :sale_id
      t.integer :settlement_type_id
      
      t.boolean :is_complimentary
      t.float :amount
      
      t.timestamps
    end
    
    add_index :sale_settlement_types, :sale_id
    add_index :sale_settlement_types, :settlement_type_id
  end
end
