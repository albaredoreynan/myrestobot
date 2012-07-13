class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :vat
      t.integer :customer_count
      t.integer :transaction_count
      t.float :delivery_sales
      t.float :service_charge
      t.datetime :sale_date_time
      
      t.float :gc_redeemed
      t.float :gc_sales
      t.float :cash_in_drawer
      t.float :other_income
      t.float :delivery_transaction_count
      t.float :credit_card_transaction_count
      
      t.integer :creator_id
      
      t.integer :branch_id
      t.timestamps
    end
    add_index :sales, :branch_id
  end
end
