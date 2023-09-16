Rails.application.routes.draw do
  root "breweries#index"

  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: %i[index new create destroy]
  resource :session, only: %i[new create destroy]

  get "signup", to: "users#new"
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
end
