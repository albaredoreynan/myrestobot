class RemoveDeletedAtFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :deleted_at
  end
end
