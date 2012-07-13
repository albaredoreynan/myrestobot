class AddGroupIsActiveCostToItems < ActiveRecord::Migration
  def change
     add_column :items, :group, :string
     add_column :items, :is_active, :boolean
     add_column :items, :cost, :float
  end
end
