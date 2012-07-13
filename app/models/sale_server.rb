class SaleServer < ActiveRecord::Base
  
  # attr_accessible :title, :body
  belongs_to :sale
end
