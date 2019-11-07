Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks 
  namespace :admin do
    resources :users
  end
  resources :labelings

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
