Rails.application.routes.draw do
 

  root "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/attendance', to: 'user_events#create'

  resources :users
  resources :events
  resources :user_events

end
