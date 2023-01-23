Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "plants#index"
  resources :plants, only: [:show]

  resources :questions, only: [:index, :show]
end
