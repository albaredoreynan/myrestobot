class AddQuantityToItems < ActiveRecord::Migration
  def change
    add_column :items, :quantity, :float
  end
end
