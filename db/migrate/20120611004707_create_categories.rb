class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      
      t.integer :client_id
      t.integer :concept_id
      t.integer :branch_id
      
      t.timestamps
    end
    
    add_index :categories, :concept_id
    add_index :categories, :client_id
    add_index :categories, :branch_id
  end
end
