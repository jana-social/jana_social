Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # patch "/api/v1/users/:id", to: "/api/v1/users#update", as: :api_v1_users_update

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
      get "/users/:id/events/:id", to: "users/events#show"
      delete "/users/:user_id/events/:id", to: "events#delete"

      get '/search', to: 'search#find'
      post '/login', to: 'sessions#create'
      patch "/users/:id", to: "users#update", as: :users_update
      put "/users/:id", to: "users#update"

      resources :users, only: %i[index show create destroy] do
        resources :events, only: %i[create update]
        get "friendships", to: "users/friendships#index", on: :member
        get "find_friends", to: "users/search_friends#index", on: :member
        get "find_events", to: "users/search_events#index", on: :member
      end
      resources :events, only: %i[index show] do
        resources :event_users, only: %i[index]
      end
      resources :friendships, only: %i[create]
      resources :uploads, only: [:index, :create, :new]
    end
  end
end
