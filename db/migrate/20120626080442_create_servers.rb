class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.integer :branch_id
      
      t.timestamps
    end
    
    add_index :servers, :branch_id
  end
end
