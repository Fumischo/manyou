Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks 
  namespace :admin do
    resources :users
  end

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
