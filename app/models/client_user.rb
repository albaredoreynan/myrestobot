class ClientUser < ActiveRecord::Base
  
  belongs_to :branch
  belongs_to :concept  
  belongs_to :client
  #belongs_to :role
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessor :login
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login
  attr_accessible :branch_id, :concept_id, :client_id
  #attr_accessible :branch_id, :concept_id, :client_id, :role_id
  attr_accessible :first_name, :last_name, :role
  # attr_accessible :title, :body
  
  def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        else
          where(conditions).first
        end
  end
  
end
