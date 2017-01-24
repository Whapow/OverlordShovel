Rails.application.routes.draw do
  root to: 'campaigns#index'

  resources :players do
    collection do
      get 'sign_up', as: :new_registration, action: :new_registration
      post 'sign_up', as: :create_registration, action: :create_registration
    end
    get 'change_password', as: :change_password, action: :change_password
    put 'change_password', as: :update_password, action: :update_password
    resources :characters
  end

  get "login" => 'sessions#login', as: :login
  resources :sessions, only: [] do
    collection do
      post :go
      put :logout
    end
  end

  resources :campaigns do
    resources :chapters do
      resources :journals do
        resources :appearances
      end
    end
  end

  resources :items
  resources :game_systems


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
