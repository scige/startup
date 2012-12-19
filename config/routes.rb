Startup::Application.routes.draw do
  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

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
  root :to => 'home#index'

  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'user_sessions#new', :as => :login
  get 'account' => 'coupons#index', :as => :account
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  get 'about' => 'home#about', :as => :about
  get 'contact' => 'home#contact', :as => :contact

  resources :home, :only => [] do
    get :about, :on => :collection
    get :contact, :on => :collection
  end

  resources :products, :only => [:show]

  resources :coupons, :only => [:create, :index, :destroy] do
    get :unuse, :on => :collection
    get :used, :on => :collection
  end

  match '/filters/select/:c_id/:d_id', :controller=>'filters', :action=>'select'
  resources :filters, :only => [] do
    get :today, :on => :collection
    post :search, :on => :collection
  end

  get 'checkcoupon' => 'companies#check_coupon', :as => :checkcoupon

  resources :companies, :only => [] do
    post :update_coupon, :on => :collection
  end

  namespace :admin do
    root :to => 'products#index'
    resources :products, :except => [:show]
    resources :categories, :except => [:show]
    resources :districts, :except => [:show]
    resources :users, :except => [:show]
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  # route for namespace :admin
  # namespace :admin do
  #   root :to => 'products#index'
  # end
  # match ':controller(/:action(/:id))(.:format)', controller: /admin\/[^\/]+/
end
