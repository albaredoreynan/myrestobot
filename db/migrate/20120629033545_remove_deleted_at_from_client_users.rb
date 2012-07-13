class RemoveDeletedAtFromClientUsers < ActiveRecord::Migration
  def change
    remove_column :client_users, :deleted_at
  end
end
