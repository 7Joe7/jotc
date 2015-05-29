Rails.application.routes.draw do

  root 'crossroads#home'
  get 'crossroads/about'
  get 'crossroads/contact'
  post 'crossroads/contact'

  get 'lessons' => 'lessons#home'
  get 'lessons/links'
  get 'lessons/about'
  get 'lessons/contact'
  post 'lessons/contact'
  get 'lessons/reservations' => 'reservations#new'
  post 'lessons/reservations' => 'reservations#create'
  delete 'lessons/reservations' => 'reservations#destroy'
  patch 'lessons/reservation' => 'reservations#edit'
  get 'lessons/price_list'
  get 'lessons/chess/famous_games' => 'chess#famous_games'
  get 'lessons/chess/tactics' => 'chess#tactics'
  get 'lessons/chess/tips' => 'chess#tips'
  get 'lessons/chess/bohemka' => 'chess#bohemka'
  get 'lessons/learning_concepts'

  get 'software/about'
  get 'software' => 'software#home'
  get 'software/contact'
  post 'software/contact'
  get 'software/examples'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'account_activations/edit'
  get 'sessions/new'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :messages, only: [:new, :create, :destroy]


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