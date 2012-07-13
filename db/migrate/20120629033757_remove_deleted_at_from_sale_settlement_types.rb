class RemoveDeletedAtFromSaleSettlementTypes < ActiveRecord::Migration
  def change
    remove_column :sale_settlement_types, :deleted_at
  end
end
