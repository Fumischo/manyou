Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
