Rails.application.routes.draw do
  get 'transactions/create'
  get 'transactions' => 'transactions#index'
  get 'transactions/:user_id' => 'transactions#show_buyer'

  get 'products/index' => 'products#index'
  get 'products/:id' => 'products#show'
  get 'product/new' => 'products#new'
  post 'products/create' => 'products#create'
  delete 'products/destroy' => 'products#destroy'
  resources :products do
    resources :transactions, only: [:create]
  end

  root 'products#index'

  resources :users, except: [:new]
  resources :products, except: [:new]

  get '/register' => 'users#new'
  post '/register' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  # root 'posts#index'
end
