class AddDeletedAtToSaleServers < ActiveRecord::Migration
  def change
    add_column :sale_servers, :deleted_at, :datetime
  end
end
