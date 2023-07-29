Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#welcome'  
  # get "/", to: "application#welcome"
  namespace :api do
    namespace :v1 do
      get "/users/:id/events/hosting", to: "users/events#hosting"
      get "/users/:id/events/attending", to: "users/events#attending"
      delete "/users/:user_id/events/:id", to: "events#delete"
      resources :users do
        resources :events, only: %i[create update]
      end, only: %i[index show create update destroy]
      resources :events, only: %i[index show]
    end
  end

end
