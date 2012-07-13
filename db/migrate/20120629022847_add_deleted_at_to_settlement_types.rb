class AddDeletedAtToSettlementTypes < ActiveRecord::Migration
  def change
    add_column :settlement_types, :deleted_at, :datetime
  end
end
