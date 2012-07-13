Restobot::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'account#index'
  
  devise_for :client_users do
    root :to => "account#index"
  end
  
  namespace :account do
    namespace :setup_module do
      namespace :organization_setup do
        resources :client_users
        resources :clients
        resources :concepts
        resources :branches
        resources :roles
      end
      resources :organization_setup
      
      namespace :inventory_setup do
        resources :items
          match 'items/:id/available_units', :controller => 'items', :action => 'available_units'
        resources :categories
        resources :subcategories
        resources :units
        resources :conversions
      end
      resources :inventory_setup
      
      namespace :purchases_setup do
        resources :suppliers
      end
      resources :purchases_setup
      
      namespace :sales_setup do
        resources :sale_categories
        resources :settlement_types
        resources :servers
      end
      resources :sales_setup
      
    end
    resources :setup_module
    
    namespace :sales_module do
      resources :sales
    end
    
    resources :sales_module
    
    namespace :purchases_module do
      resources :purchases
      resources :purchase_items do
        get :autocomplete_item_name, :on => :collection
      end
    end
    resources :purchases_module
    
    namespace :inventory_module do
      resources :endcounts
      resources :item_counts
    end
    resources :inventory_module
    
    namespace :reports_module do
      resources :sales_reports
      resources :purchases_reports
      resources :directional_reports
      resources :endcounts_reports
    end
    resources :reports_module
  end
  
  resources :account
  
  #match "/sales_modules/sales", :to => "sales_modules/sales#index", :via => "post"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
