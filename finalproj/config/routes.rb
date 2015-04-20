Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers, except: [:index, :show, :new]
  end

  # Removes notifications
  delete 'notifications', to: 'notifications#remove'
  # Upvotes a question, the users rep, and creates a notification
  post 'questions/:id/upvote', to: 'questions#upvote', as: :question_upvote
  # Upvotes an answer, the users rep, and creates a notification
  post 'questions/:question_id/answers/:id/upvote', to: 'answers#upvote', as: :answer_upvote

  get 'query' => 'questions#query'

  root 'questions#index'

  get 'profile/list' => 'profile#index'
  get 'profile/:username/delete', to: 'profile#delete'
  get 'profile/:username' => 'profile#show'
  post 'profile/:username' => 'profile#update'


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
