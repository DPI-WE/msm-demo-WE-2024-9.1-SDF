Rails.application.routes.draw do
  devise_for :users
  resources :directors
  resources :likes, only: [:create]
  resources :movies
  resources :search, only: [:index]

  root "movies#index"
end
