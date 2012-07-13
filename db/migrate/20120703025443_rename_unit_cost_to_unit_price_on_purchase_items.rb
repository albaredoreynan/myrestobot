class RenameUnitCostToUnitPriceOnPurchaseItems < ActiveRecord::Migration
  def change
    rename_column :purchase_items, :unit_cost, :unit_price
  end
end
