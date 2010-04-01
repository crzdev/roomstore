ActionController::Routing::Routes.draw do |map|
  map.resources :addresses

  map.resources :streets

  map.resources :localities

  map.resources :sub_administrative_areas

  map.resources :administrative_areas

  map.resources :cities

  map.resources :mo_districts

  map.connect "group_administrating/:id/show_user", :controller => "group_administrating", :action => "show_user"
  map.connect "group_administrating/:id/edit_user", :controller => "group_administrating", :action => "edit_user"
  map.connect "group_administrating/:id/update_user", :controller => "group_administrating", :action => "update_user"
  map.connect "group_administrating/:id/destroy_user", :controller => "group_administrating", :action => "destroy_user"
  map.resources :entries

  map.connect "user_entries/my_rents", :controller => "user_entries", :action => "my_rents"
  map.connect "user_entries/my_rents_suburban", :controller => "user_entries", :action => "my_rents_suburban"
  map.connect "user_entries/my_rents_office", :controller => "user_entries", :action => "my_rents_office"
  map.connect "user_entries/my_rents_flat_and_room", :controller => "user_entries", :action => "my_rents_flat_and_room"
  map.connect "user_entries/new_rent_subway", :controller => "user_entries", :action => "new_rent_subway"
  map.connect "user_entries/new_rent_suburban", :controller => "user_entries", :action => "new_rent_suburban"
  map.connect "user_entries/new_rent_office", :controller => "user_entries", :action => "new_rent_office"
  map.connect "user_entries/new_rent_flat", :controller => "user_entries", :action => "new_rent_flat"
  map.connect "user_entries/list_entries", :controller => "user_entries", :action => "list_entries"
  map.connect "user_entries/new_rent", :controller => "user_entries", :action => "new_rent"
  map.connect "user_entries/:id/update_rent", :controller => "user_entries", :action => "update_rent"
  map.connect "user_entries/:id/edit_rent", :controller => "user_entries", :action => "edit_rent"
  map.connect "user_entries/:id/destroy", :controller => "user_entries", :action => "destroy"
  map.resources :user_entries

  map.connect "group_administrating", :controller => "group_administrating", :action => "index"

  map.resources :groups

  map.connect "users/login", :controller => "users", :action => "login"
  map.connect "users/logout", :controller => "users", :action => "logout"
  map.connect "users/session_test", :controller => "users", :action => "session_test"
  map.resources :users
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "oldsite"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
