require 'gollum/app'
require 'gollum-lib'
require 'rubygems'

Rails.application.routes.draw do
  
  resources :real_names

  get 'projects/history'
  
  resources :comment_upvotes

  resources :notifications

  resources :post_upvotes

  resources :partnerships

  resources :attachments

  resources :projects

  mount Ckeditor::Engine => '/ckeditor'
  get 'wiki/show'

  resources :wikis
  
  Precious::App.set(:gollum_path, Rails.root.join('wiki').to_s)
  Precious::App.set(:default_markup, :markdown) # set your favorite markup language
  Precious::App.set(:wiki_options, {:universal_toc => true})
  Precious::App.set(:wiki_options, {:css => true})
  mount Precious::App, at: '/wiki'

  get 'team/teampage'

  get 'admin_pg/index'
 
  devise_for :users
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'

  get 'wiki/index'

  get 'home/index'

  get 'editor/index'

  get 'groups/assign'

  get 'evaluations/assign'

  get 'evaluations/index'

  post 'evaluations/save_rankings'

  get 'groups/join'

  get 'groups/remove_user'

  


  
  resources :evaluations do
    post :update_row_order, on: :collection

  end
  
  resources :assignments

  resources :groups do
    resources :memberships
    resources :users
  end

  resources :posts do
    resources :comments
    resources :evaluations
    end

  resources :users do
    resources :evaluations
    resources :groups
    resources :memberships
  end

  root to:"home#index"




  

  
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
