class CreateSaleSaleCategories < ActiveRecord::Migration
  def change
    create_table :sale_sale_categories do |t|
      t.integer :sale_id
      t.integer :sale_category_id
      
      t.float :amount
      
      t.timestamps
    end
    add_index :sale_sale_categories, :sale_id
    add_index :sale_sale_categories, :sale_category_id
  end
end
