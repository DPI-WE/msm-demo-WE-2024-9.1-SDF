Rails.application.routes.draw do
  draw(:admin)
  draw(:pwa)
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  resources :directors
  resources :analytics, only: [:index] do
    collection do
      get "number_of_films_by_director"
      get "number_of_films_by_year"
      get "movies_by_popularity"
      get "directors_by_popularity"
    end
  end
  resources :likes, only: [:create]
  resources :movies
  resources :search, only: [:index]

  root "movies#index"
end
