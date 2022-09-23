Rails.application.routes.draw do
  get 'manage/index'
  get 'books/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'books/:id', to: 'books#details'
  get 'manage', to: 'manage#index'

  # Defines the root path route ("/")
  root "books#index"


end
