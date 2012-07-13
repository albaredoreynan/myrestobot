class Server < ActiveRecord::Base
  
  belongs_to :branch

  has_many :sale_servers
  has_many :sales, :through => :sale_servers
  
  attr_accessible :branch_id, :name
  
  validates_presence_of :name, :branch_id, :branch
end
