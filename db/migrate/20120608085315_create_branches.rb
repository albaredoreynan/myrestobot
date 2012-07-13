class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.integer :client_id
      t.integer :concept_id
              
      t.timestamps
    end
    
    Branch.create(:name => "Paranaque", :concept_id => 1, :client_id => 1)
    
    add_index :branches, :concept_id
    add_index :branches, :client_id
  end
end
