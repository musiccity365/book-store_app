Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/books/oldest', to: 'books#oldest', as: 'oldest_book'
  # get '/books', to: 'books#index', as: 'books'
  # get '/books/:id', to: 'books#show', as: 'book'
  resources :books, only: [:index, :show]
  # resources :users, only: [index, show, new, create] # nested routes - index, new ?
  # resources :ratings
end
