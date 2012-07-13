class Concept < ActiveRecord::Base

  belongs_to :client, :class_name => "Client"
  has_many :branches, :dependent => :destroy
  
  has_many :categories, :dependent => :destroy
  
  attr_accessible :name, :client_id, :address, :contact_number
  
  validates_presence_of :name, :client_id

end