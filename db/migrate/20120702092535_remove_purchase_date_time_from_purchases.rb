class RemovePurchaseDateTimeFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :purchase_date_time
  end
end
