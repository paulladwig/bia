Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/follow/:id', to: 'friendships#create', as: 'follow'
  patch '/follow/:id', to: 'friendships#update', as: 'update_follow'
  resources :users, only: [:show, :index]
  resources :restaurants, only: [:show, :index, :create] do
    resources :selections, only: [:create, :destroy]
    resources :shares, only: [:create]
  end
  get '/recommend', to: 'restaurants#new', as: 'recommend'
  get '/discover', to: 'selections#index'
  # get '/search', to: 'pages#search', as: 'search'
  get '/profile', to: 'users#profile', as: 'profile'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/about', to: 'pages#about', as: 'about'
  get '/terms', to: 'pages#terms', as: 'terms'
end
