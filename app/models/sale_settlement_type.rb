class SaleSettlementType < ActiveRecord::Base
  
  attr_accessible :settlement_type_id, :amount
  belongs_to :sale
  belongs_to :settlement_type
  
end
