class SaleCategory < ActiveRecord::Base
  
  belongs_to :concept
  
  attr_accessible :name, :branch_id, :concept_id, :client_id
  
  has_many :sale_sale_categories
  has_many :sales, :through => :sale_sale_categories
  
  validates_presence_of :name, :concept_id, :concept
end
