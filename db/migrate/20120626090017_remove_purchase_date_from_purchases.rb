class RemovePurchaseDateFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :purchase_date
  end
end
