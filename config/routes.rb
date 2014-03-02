Storefront::Application.routes.draw do
  devise_for :users , :skip => [:registrations]
  devise_scope :user do
    get "signup",   :to => "users#new"
    get "signin",   :to => "devise/sessions#new"
    get "signout",  :to => "devise/sessions#destroy"
    get "cancel_user_registration", :to => "devise/registrations#cancel"
    post "user_registration",       :to => "devise/registrations#create"
    get "new_user_registration",    :to => "devise/registrations#new"
    get "edit_user_registration",   :to => "devise/registrations#edit"
    put "user_registration", :to => "devise/registrations#update"
  end

  # get "users/show"
  # get "home/index"
  # get "items/new"
  # get "items/edit"
  # get "items/show"
  # get "items/index"
  # get "users/new"
  # get "users/index"
  # get "users/edit"
  # get "users/delete"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :users
  resources :items

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
