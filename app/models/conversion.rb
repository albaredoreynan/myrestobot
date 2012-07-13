class Conversion < ActiveRecord::Base
  attr_accessible :bigger_unit_id, :smaller_unit_id, :conversion_factor
  
  validates_presence_of :bigger_unit_id, :smaller_unit_id
  
  belongs_to :bigger_unit, :class_name => "Unit"
  belongs_to :smaller_unit, :class_name => "Unit"
  
end
