Rails.application.routes.draw do
  #homepage route
  root "sessions#welcome"
  #omniauth callback route
  match '/auth/github/callback', to: 'users#omniauth', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  #logout route
  get '/logout' => 'sessions#destroy'


  resources :ratings

  resources :books do
    resources :ratings, only: [:index, :new, :create]
  end

end
