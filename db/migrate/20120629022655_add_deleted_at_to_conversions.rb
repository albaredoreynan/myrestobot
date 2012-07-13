class AddDeletedAtToConversions < ActiveRecord::Migration
  def change
    add_column :conversions, :deleted_at, :datetime
  end
end
