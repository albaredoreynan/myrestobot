class Client < ActiveRecord::Base
  
  has_many :concepts, :dependent => :destroy

  attr_accessible :name, :address, :contact_number
  
  validates_presence_of :name
end
