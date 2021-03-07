Rails.application.routes.draw do
  #omniauth callback route
  match '/auth/github/callback', to: 'users#omniauth', via: [:get, :post]
  get 'sessions/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  #logout route
  get '/logout' => 'sessions#destroy'

  #homepage route
  root "sessions#home"

  resources :ratings
  resources :users

  resources :books do
    resources :ratings, only: [:index, :new, :create]
  end
  # resources :genres do
  #   resources :books, only: [:index]
  # end
  resources :books, only: [:index, :show, :new]

end
