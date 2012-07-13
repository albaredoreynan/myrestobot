class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :client_id
      t.integer :concept_id
      t.integer :branch_id
      
      t.timestamps
    end
    
    Role.create(:name => "Administrator", :concept_id => 1, :client_id => 1, :branch_id => 1)
    
    add_index :roles, :concept_id
    add_index :roles, :client_id
    add_index :roles, :branch_id
  end
end
