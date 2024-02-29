Rails.application.routes.draw do
  devise_for :users
  resources :directors
  root "movies#index"
  get 'movies/add_movie', to: 'movies#add_movie', as: "add_movie"
  resources :movies
end
