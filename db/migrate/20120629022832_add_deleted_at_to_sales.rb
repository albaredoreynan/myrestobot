class AddDeletedAtToSales < ActiveRecord::Migration
  def change
    add_column :sales, :deleted_at, :datetime
  end
end
