class RemoveDeletedAtFromSaleServers < ActiveRecord::Migration
  def change
    remove_column :sale_servers, :deleted_at
  end
end
