class SaleSaleCategory < ActiveRecord::Base
  
  attr_accessible :sale_category_id, :amount
  belongs_to :sale 
  belongs_to :sale_category
end
