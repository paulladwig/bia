Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants, only: [:show, :index]
  get '/discover', to: 'selections#index'

end
