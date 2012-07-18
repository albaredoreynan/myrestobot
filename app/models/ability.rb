class Ability
  include CanCan::Ability
  
  def initialize(client_user)
    client_user ||= ClientUser.new
    role_name = client_user.role
    
    case role_name
    
    when 'branch'

      #branch_id = client_user.branch.id
      #organization setup
      can :read, Client, :id => client_user.client_id
      cannot [:create, :edit, :update, :destroy], Client, :id => client_user.client_id

      can :read, ClientUser, :client_id => client_user.client_id
      cannot [:create, :edit, :update, :destroy], ClientUser, :client_id => client_user.client_id
      
      can :read, Branch, :client_id => client_user.client_id
      cannot [:create, :edit, :update, :destroy], Branch, :id => client_user.branch_id

      can :read, Role
      cannot [:create, :edit, :update, :destroy], Role
      
      can :read, Concept, :client_id => client_user.client_id
      cannot [:create, :edit, :update, :destroy], Concept, :id => client_user.concept_id
      
      #sale setup
      can :read, SaleCategory, :concept_id => client_user.concept_id
      cannot [:create, :edit, :update, :destroy], SaleCategory, :concept_id => client_user.concept_id
      
      can :read, SettlementType, :concept_id => client_user.concept_id
      cannot [:create, :edit, :update, :destroy], SettlementType, :concept_id => client_user.concept_id
      
      can :read, Server, :branch_id => client_user.branch_id
      cannot [:create, :edit, :update, :destroy ], Server, :concept_id => client_user.concept_id  

      #inventory setup  
      can :read, Category
      cannot [:create, :edit, :update, :destroy], Category
      
      can :read, Subcategory
      cannot [:create, :edit, :update, :destroy], Subcategory
      
      can :read, Item
      cannot [:create, :edit, :update, :destroy], Item
      
      can :read, Sale
      cannot [:create, :edit, :update, :destroy], Sale
      
      
    when 'client'
      client_id = client_user.client.id
      
      #Organization Setup
      can :read, Client, :id => client_user.client_id
      cannot [:new, :edit, :create], Client, :id => client_user.client_id

      can :manage, ClientUser, :client_id => client_user.client_id
      can [:new, :create], ClientUser
      
      can :manage, Branch, :client_id => client_user.client_id 
      can [:new, :create], Branch

      can :manage, Concept, :client_id => client_user.client_id
      can [:new, :create], Concept  
      
      can :manage, Role, :client_id => client_user.client_id
      can [:new, :create], Role

      #Sale Setup
      can :manage, SaleCategory, :concept => { :client => { :id => client_user.client_id } }
      can [:new, :create], SaleCategory

      can :manage, SettlementType, :concept => { :client => {:id => client_user.client_id } }
      can [:new, :create], SettlementType

      can :manage, Server, :branch => { :concept => { :client => {:id => client_user.client_id } } }
      can [:new, :create], Server


      can :manage, Item, :client_id => client_user.client_id
      can [:new, :create], Item
      
    when 'accounting'
      
      can :read, :all
      
    when 'admin'
      
      can :manage, :all
      
    end
  end
end
