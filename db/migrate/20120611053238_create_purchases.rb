class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.integer :branch_id
      t.integer :concept_id
      t.integer :client_id
      t.integer :creator_id
      
      t.integer :purchase_date
      t.string :invoice_number
      t.text :vat_type
      
      t.timestamps
    end
    
    add_index :purchases, :supplier_id
    add_index :purchases, :branch_id
    add_index :purchases, :concept_id
    add_index :purchases, :client_id
    add_index :purchases, :creator_id
  end
end
