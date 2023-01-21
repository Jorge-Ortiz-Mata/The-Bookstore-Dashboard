Rails.application.routes.draw do
  resources :sells, only: %i[new create]
  resources :books, only: %i[new create]
  root 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
