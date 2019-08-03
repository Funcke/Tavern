Rails.application.routes.draw do
  root 'application#index'

  # external informations
  get '/home', to: 'application#home', as: 'home'

  #tables resources
  resources :tables
  post 'tables/:id/edit', to: 'tables#update', as: 'place_order'
  get 'tables/:id/qr', to: 'tables#generate_qr', as: 'generate_qr'

  # sessions resources
  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #users resources
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  
  # orders resources
  get 'order/:id', to: 'orders#pay', as: 'order'
  post 'orders', to: 'orders#pay_group', as: 'orders'

  # organizations resources
  resources :organizations, only: [:show, :edit, :update, :destroy]

  #roles resources
  resources :roles, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
