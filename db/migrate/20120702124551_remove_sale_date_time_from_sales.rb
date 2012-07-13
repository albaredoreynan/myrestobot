class RemoveSaleDateTimeFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :sale_date_time
  end
end
