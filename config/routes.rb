Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants, only: [:show, :index]
  resources :users, only: [:show]
  resources :restaurants, only: [:show, :index] do
    resources :selections, only: [:create]
  end
  get '/discover', to: 'selections#index'
end
