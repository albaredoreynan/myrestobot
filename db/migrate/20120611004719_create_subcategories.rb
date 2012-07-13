class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.text :description
      
      t.integer :category_id
      t.integer :client_id
      t.integer :concept_id
      t.integer :branch_id
      
      t.timestamps
    end
    
    add_index :subcategories, :category_id
    add_index :subcategories, :concept_id
    add_index :subcategories, :client_id
    add_index :subcategories, :branch_id
  end
end
