Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurant, only: [:show]
end
