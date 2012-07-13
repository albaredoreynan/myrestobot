class Ability
  include CanCan::Ability

  def initialize(client_user)
    client_user ||= ClientUser.new
    role_name = client_user.role
    
    case role_name
    
    when 'branch'  
      branch_id = client_user.branch.id
      
      can :read, Client
      cannot [:create, :edit, :update, :destroy], Client
      
      can :read, ClientUser
      cannot [:create, :edit, :update, :destroy], ClientUser
      
      can :read, Branch
      cannot [:create, :edit, :update, :destroy], Branch
      
      can :read, Concept
      cannot [:create, :edit, :update, :destroy], Concept
      
      can :read, SaleCategory
      cannot [:create, :edit, :update, :destroy], SaleCategory
      
      can :read, SettlementType
      cannot [:create, :edit, :update, :destroy], SettlementType
      
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
      
      can :manage, ClientUser
      can [:new, :create], ClientUser
      
      can :manage, Branch, :concept => { :client => { :id => client_id } }
      can [:new, :create], Branch, :concept => { :client => { :id => client_id } }
      
      can :manage, Concept
      can [:new, :create], Concept
      
      can :manage, Sale
      
    when 'accounting'
      
      can :read, :all
      
    when 'admin'
      
      can :manage, :all
      
    end
  end
end
