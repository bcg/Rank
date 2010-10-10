Orgg3::Application.routes.draw do

  # resource :site_configuration
  resource :bookmarklet, :controller => "bookmarklet"
  # match 'bookmarklet' => "bookmarklet#show", :as => :bookmarklet
  # match 'bookmarklet/new' => "bookmarklet#new", :as => :new_bookmarklet

  resources :comments do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :posts do
    member do
      post 'upvote'
      post 'downvote'
    end
    resources :comments
  end

  resources :buckets, :path => 'categories' do 
    member do
      post 'join'
    end
    resources :posts
  end

  match 'login' => 'user_sessions#new', :as => :login
  match 'authenticate' => "user_sessions#create", :as => :authenticate
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'signup' => 'users#new', :as => :signup
  match 'register' => 'users#create', :as => :register

  resources :users

  match 'dashboard' => 'dashboard#index', :as => :dashboard

  root :to => "user_sessions#new"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
