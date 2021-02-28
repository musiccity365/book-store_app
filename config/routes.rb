Rails.application.routes.draw do
  get 'sessions/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :create] # nested routes - index, new ?
  resources :ratings

  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #homepage route
  root "sessions#home"
end
