class RemoveDeletedAtFromConcepts < ActiveRecord::Migration
  def change
    remove_column :concepts, :deleted_at
  end
end
