Rails.application.routes.draw do
  #homepage route
  get '/login' => 'sessions#new'
  root "sessions#welcome"
  #omniauth callback route
  # get '/auth/github/callback', to: 'sessions#omniauth'
  match '/auth/github/callback', to: 'users#omniauth', via: [:get, :post]
  # get 'sessions/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  #login route
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  #logout route
  get '/logout' => 'sessions#destroy'


  resources :ratings
  # resources :users

  resources :books do
    resources :ratings, only: [:index, :new, :create]
  end
  # resources :genres do
  #   resources :books, only: [:index]
  # end
  resources :books, only: [:index, :show, :new]

end
