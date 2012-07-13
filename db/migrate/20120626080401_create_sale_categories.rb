class CreateSaleCategories < ActiveRecord::Migration
  def change
    create_table :sale_categories do |t|
      t.string :name
      t.integer :concept_id
      
      t.timestamps
    end
    
    add_index :sale_categories, :concept_id
  end
end
