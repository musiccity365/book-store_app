Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [index, show, new, create] # nested routes - index, new ?
  resources :ratings
end
