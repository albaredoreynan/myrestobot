class AddDeletedAtToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :deleted_at, :datetime
  end
end
