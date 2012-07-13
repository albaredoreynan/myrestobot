class AddDeletedAtToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :deleted_at, :datetime
  end
end
