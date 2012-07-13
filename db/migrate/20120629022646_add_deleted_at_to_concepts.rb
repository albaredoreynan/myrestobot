class AddDeletedAtToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :deleted_at, :datetime
  end
end
