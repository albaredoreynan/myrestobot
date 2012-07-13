class RemoveDeletedAtFromServers < ActiveRecord::Migration
  def change
    remove_column :servers, :deleted_at
  end
end
