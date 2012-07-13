class RemoveDeletedAtFromUnits < ActiveRecord::Migration
  def change
    remove_column :units, :deleted_at
  end
end
