Rails.application.routes.draw do
 
  get 'sessions/new'
  get 'sessions/create'
  root "users#new"
  resources :users
end
