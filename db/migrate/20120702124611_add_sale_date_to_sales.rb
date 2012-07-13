class AddSaleDateToSales < ActiveRecord::Migration
  def change
    add_column :sales, :sale_date, :date
  end
end
