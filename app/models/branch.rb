class Branch < ActiveRecord::Base
  
  belongs_to :concept, :class_name => "Concept"
  belongs_to :client, :class_name => "Client"
  
  has_many :roles, :dependent => :destroy
  
  has_many :suppliers, :dependent => :destroy
  
  has_many :endcounts, :dependent => :destroy
  
  attr_accessible :name, :concept_id, :client_id, :address, :contact_number
  
  validates_presence_of :name, :concept_id

end
