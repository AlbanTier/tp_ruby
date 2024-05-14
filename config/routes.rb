Rails.application.routes.draw do
  get 'products/index' => 'products#index'
  get 'products/:id' => 'products#show'
  get 'product/new' => 'products#new'
  post 'products/create' => 'products#create'
  delete 'products/destroy' => 'products#destroy'
  root 'application#index'
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
