class DeviseCreateClientUsers < ActiveRecord::Migration
  def change
    create_table(:client_users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token
      
      t.integer :branch_id
      t.integer :concept_id
      t.integer :client_id
      t.integer :role_id

      t.timestamps
    end
    ClientUser.create(:email => "vincep@primehospitality.com", :password => "password", :password_confirmation => "password", :role_id => 1, :branch_id => 1, :concept_id => 1, :client_id => 1)
    
    add_index :client_users, :email,                :unique => true
    add_index :client_users, :reset_password_token, :unique => true
    add_index :client_users, :concept_id
    add_index :client_users, :client_id
    add_index :client_users, :branch_id
    add_index :client_users, :role_id
    # add_index :client_users, :confirmation_token,   :unique => true
    # add_index :client_users, :unlock_token,         :unique => true
    # add_index :client_users, :authentication_token, :unique => true
  end
end
