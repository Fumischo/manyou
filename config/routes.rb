Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :users, only:[:new, :create, :show]
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
