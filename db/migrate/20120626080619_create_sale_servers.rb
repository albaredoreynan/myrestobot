class CreateSaleServers < ActiveRecord::Migration
  def change
    create_table :sale_servers do |t|
      t.integer :sale_id
      t.integer :server_id
      
      t.float :amount
      
      t.timestamps
    end
    
    add_index :sale_servers, :sale_id
    add_index :sale_servers, :server_id
  end
end
