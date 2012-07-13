class AddPurchaseDateTimeToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_date_time, :datetime
  end
end
