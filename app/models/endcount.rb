class Endcount < ActiveRecord::Base
  attr_accessible :entry_date, :branch_id, :item_counts_attributes
  
  belongs_to :branch
  
  has_many :item_counts
  has_many :items, :through => :item_counts
  
  accepts_nested_attributes_for :item_counts
end
