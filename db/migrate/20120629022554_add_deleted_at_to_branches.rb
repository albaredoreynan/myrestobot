class AddDeletedAtToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :deleted_at, :datetime
  end
end
