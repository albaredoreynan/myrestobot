class RemoveDeletedAtFromConversions < ActiveRecord::Migration
  def change
    remove_column :conversions, :deleted_at
  end
end
