class AddDeletedAtToClientUsers < ActiveRecord::Migration
  def change
    add_column :client_users, :deleted_at, :datetime
  end
end
