class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.integer :purchase_id
      t.integer :item_id
      
      t.integer :unit_id
      t.float :unit_cost
      t.float :quantity
      t.float :amount
      t.text :vat_type
      t.string :particulars
      
      t.timestamps
    end
    
    add_index :purchase_items, :purchase_id
    add_index :purchase_items, :item_id
  end
end
