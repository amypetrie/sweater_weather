Rails.application.routes.draw do
root to: "welcome#index"
  namespace :api do
    namespace :v1 do
      get "/forecast", to: "location_forecast#index"
      get "/gifs", to: "upcoming_forecast#index"
      resources :users, only: [:new, :create]
      resources :sessions, only: [:new, :create]
      get "/favorites", to: "favorites#show"
      resources :favorites, only: [:new, :create]
    end
  end
end
