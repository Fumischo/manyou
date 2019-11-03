Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks 
  namespace path:admin do
    resources :users
  end
end
