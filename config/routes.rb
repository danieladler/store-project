Rails.application.routes.draw do

  get  "/sign-up"               , to: "users#sign_up"
  post "/users"                 , to: "users#create"

  post "/sign-in"               , to: "sessions#sign_in" , as: :sign_in
  get  "/sign-out"              , to: "sessions#sign_out", as: :sign_out

  get    "/"                       , to: "products#index"   , as: :home
  get    "/products/:product_id"   , to: "products#show"    , as: :show_product
  patch  "/products/:product_id"   , to: "products#edit"    , as: :edit_product
  delete "/products/:product_id"   , to: "products#delete"  , as: :delete_product

  get "/admin/products"         , to: "products#admin"   , as: :products
  get "/admin/products/new"     , to: "products#new"     , as: :new_product

  post "/admin/products"         , to: "products#add"   , as: :add_product

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
