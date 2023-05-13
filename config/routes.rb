Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :events, only: %i[index show new create edit update] do
    resources :attendances, only: %i[create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
end
