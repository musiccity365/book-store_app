Rails.application.routes.draw do
  resources :books
  resources :users
  resources :ratings, only: [:index, :show, :new, :create, :edit, :update] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
