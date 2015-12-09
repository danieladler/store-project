Rails.application.routes.draw do

  get  "/sign-up"                  , to: "users#sign_up"
  post "/users"                    , to: "users#create"
  get  "/users/:user_id/account"   , to: "users#show"       , as: :user_account

  post "/sign-in"                  , to: "sessions#sign_in" , as: :sign_in
  get  "/sign-out"                 , to: "sessions#sign_out", as: :sign_out

  get    "/"                       , to: "products#index"   , as: :home
  post   "/products"               , to: "products#add"     , as: :add_product
  get    "/products/:product_id"   , to: "products#show"    , as: :show_product
  patch  "/products/:product_id"   , to: "products#edit"    , as: :edit_product
  delete "/products/:product_id"   , to: "products#delete"  , as: :delete_product

  get  "/admin/products"            , to: "admin#index"     , as: :admin_products
  get  "/admin/products/new"        , to: "admin#new"       , as: :new_product
  get  "/admin/products/:product_id", to: "admin#edit_view" , as: :edit_view

  post   "/products/:product_id"   , to: "product_options#add"     , as: :product_options
  patch  "/products/:product_id"   , to: "product_options#edit"    , as: :edit_option
  delete "/products/:product_id"   , to: "product_options#delete"  , as: :delete_option

  get "/admin/orders"                  , to: "orders#index"      , as: :orders
  get "/users/:user_id/cart"           , to: "orders#cart"       , as: :user_cart
  get "/users/:user_id/checkout"       , to: "orders#checkout"   , as: :checkout
  post "/orders/"                      , to: "orders#create"     , as: :new_order
  patch  "/orders/:order_id"           , to: "orders#finish_checkout"  , as: :finish_checkout
  get "/orders/:order_id/"             , to: "orders#confirm"     , as: :order_confirm

  post "/items"                    , to: "items#add_to_cart"     , as: :new_item
  delete "/items/:item_id"         , to: "items#remove_from_cart", as: :delete_item

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
