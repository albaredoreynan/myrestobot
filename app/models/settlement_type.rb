class SettlementType < ActiveRecord::Base
  
  belongs_to :concept
  
  attr_accessible :name, :concept_id, :is_complimentary
  
  has_many :sale_settlement_types
  has_many :sales, :through => :sale_settlement_types
  
  validates_presence_of :name, :concept_id, :concept

end
