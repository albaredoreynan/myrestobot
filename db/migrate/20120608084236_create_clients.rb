class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :contact_number
        
      t.timestamps
    end
    
    Client.create(:name => "Buffalo's Wings N' Things")
  end
end
