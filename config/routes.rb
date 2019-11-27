Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/index_following', to: 'friendships#index_following', as: 'following'
  get '/index_followers', to: 'friendships#index_followers', as: 'followers'
  resources :restaurants, only: [:show, :index]
  resources :users, only: [:show]
  resources :restaurants, only: [:show, :index] do
    resources :selections, only: [:create]
  end
  get '/discover', to: 'selections#index'
end
