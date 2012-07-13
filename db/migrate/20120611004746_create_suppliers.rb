class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :contact_person
      t.string :contact_number
      t.string :contact_title
      t.string :tin
      t.text :description
      
      t.integer :client_id
      t.integer :concept_id
      t.integer :branch_id
      
      t.timestamps
    end
    
    add_index :suppliers, :concept_id
    add_index :suppliers, :client_id
    add_index :suppliers, :branch_id
  end
end
