class AddDeletedAtToSaleSettlementTypes < ActiveRecord::Migration
  def change
    add_column :sale_settlement_types, :deleted_at, :datetime
  end
end
