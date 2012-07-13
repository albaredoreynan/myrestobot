class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.integer :client_id
      
      t.timestamps
    end
    
    Concept.create(:name => "Buffalo's Wings N' Things", :client_id => 1)
    
    add_index :concepts, :client_id
    
  end
end
