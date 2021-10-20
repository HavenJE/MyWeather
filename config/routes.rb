Rails.application.routes.draw do
  resources :sessions
# Write your custom routes below: 

  # root route for home page 
  root 'sessions#home'
  
  # signup routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :comments
  resources :categories
  resources :users
  resources :locations
 
end
