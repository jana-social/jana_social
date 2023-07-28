Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#welcome'
  # get "/", to: "application#welcome"
  namespace :api do
    namespace :v1 do
      get "/users/:id/events/hosting", to: "users/events#hosting"
      resources :users
      resources :events, only: %i[index show]
    end
  end

end
