Rails.application.routes.draw do
  resources :directors
  resources :likes, only: [:create]
  resources :movies

  root "movies#index"
end
