class Unit < ActiveRecord::Base
  
  attr_accessible :name, :symbol, :unit_type, :branch_id, :concept_id, :client_id
  
  has_many :items, :dependent => :destroy
  has_many :conversion_to, :class_name => "Conversion", :foreign_key => :bigger_unit_id, :dependent => :destroy
  has_many :purchase_items, :dependent => :destroy
  
  belongs_to :concept
  
  validates_presence_of :symbol
end
