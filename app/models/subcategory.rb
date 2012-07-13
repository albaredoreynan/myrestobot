class Subcategory < ActiveRecord::Base
  
  attr_accessible :name, :description, :category_id, :concept_id, :client_id, :goal, :cogs_group, :non_inventory
  
  belongs_to :category
  has_many :items, :dependent => :destroy
  
  validates_presence_of :name, :category_id
  
end
