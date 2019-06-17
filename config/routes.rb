Rails.application.routes.draw do
 
  
  root "users#new"
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
end
