Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#welcome'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :rooms
  # get "/", to: "application#welcome"
  namespace :api do
    namespace :v1 do
      get "/users/:id/events/hosting", to: "users/events#hosting"
      get "/users/:id/events/attending", to: "users/events#attending"
      delete "/users/:user_id/events/:id", to: "events#delete"

      get '/search', to: 'search#find'

      resources :users, only: %i[index show create update destroy] do
        resources :events, only: %i[create update]
      end
      resources :events, only: %i[index show] do
        resources :event_users, only: %i[index]
      end
      resources :friendships, only: %i[create]
      
    end
  end
end
