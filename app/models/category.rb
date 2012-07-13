class Category < ActiveRecord::Base
  
  attr_accessible :name, :description, :concept_id, :client_id
  
  has_many :subcategories, :dependent => :destroy
  belongs_to :concept
  
  validates_presence_of :name
end
