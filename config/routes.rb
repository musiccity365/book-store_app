Rails.application.routes.draw do
  resources :books
  resources :users, only: [index, show, new, create] # nested routes - index, new ?
  resources :ratings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
