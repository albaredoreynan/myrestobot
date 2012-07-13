class AddFirstNameLastNameToClientUsers < ActiveRecord::Migration
  def change
    add_column :client_users, :first_name, :string
    add_column :client_users, :last_name, :string
  end
end
