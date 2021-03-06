require 'downloads_helper'

include DownloadsHelper

Rails.application.routes.draw do

  get 'news_controller/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'crossroads#home'
  get 'crossroads/about'
  get 'crossroads/contact'
  post 'crossroads/contact' => 'crossroads#create_message'
  get 'crossroads/signup'
  post 'crossroads/signup' => 'crossroads#create_user'

  get 'lessons' => 'lessons#home'
  get 'lessons/links'
  get 'lessons/about'
  get 'lessons/contact'
  post 'lessons/contact' => 'lessons#create_message'
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
  get 'lessons/signup'
  post 'lessons/signup' => 'lessons#create_user'

  get 'software/about'
  get 'software' => 'software#home'
  get 'software/contact'
  post 'software/contact' => 'software#create_message'
  get 'software/alfred_workflows'
  get 'software/modified_anybar'
  get 'software/rails_app'
  get 'software/signup'
  post 'software/signup' => 'software#create_user'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'account_activations/edit'
  get 'sessions/new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  FILES_TO_DOWNLOAD.each do |file|
    get "assets/#{file}" => "downloads##{file.gsub('.', '_')}"
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]


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