class Role < ActiveRecord::Base
  
  belongs_to :branch
  belongs_to :concept  
  belongs_to :client
  
  has_many :client_users, :dependent => :destroy
  
  attr_accessible :name, :branch_id, :client_id, :concept_id
end
