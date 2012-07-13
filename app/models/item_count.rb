class ItemCount < ActiveRecord::Base
  
  attr_accessible :item_id, :unit_id, :branch_id, :concept_id, :client_id, :stock_count
  
  belongs_to :item
  belongs_to :endcount
  
end
