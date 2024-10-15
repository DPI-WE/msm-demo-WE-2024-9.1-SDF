Rails.application.routes.draw do
  resources :directors
  resources :movies

  root "movies#index"
end
