class RemoveDeletedAtFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :deleted_at
  end
end
