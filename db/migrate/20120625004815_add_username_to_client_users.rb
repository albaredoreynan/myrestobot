class AddUsernameToClientUsers < ActiveRecord::Migration
  def change
    add_column :client_users, :username, :string
  end
end
