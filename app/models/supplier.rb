class Supplier < ActiveRecord::Base
  
  attr_accessible :name, :branch_id, :concept_id, :client_id
  attr_accessible :address, :contact_number, :email, :contact_person, :contact_title, :description, :tin
  
  belongs_to :branch
end
