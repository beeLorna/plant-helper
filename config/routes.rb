Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "plants#index"
  resources :plants, only: [:show]

  scope :plant_quiz, as: :plant_quiz do
    get :question, to: "plant_quiz#question"
    post :answer, to: "plant_quiz#answer"
  end
end
