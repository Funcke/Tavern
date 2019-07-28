Rails.application.routes.draw do
  resources :tables
  post 'tables/:id/edit', to: 'tables#update', as: 'place_order'
  root 'tables#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'order/:id', to: 'orders#pay', as: 'order'
  post 'orders', to: 'orders#pay_group', as: 'orders'
  resources :organizations, only: [:show, :edit, :update, :destroy]
  resources :roles, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
