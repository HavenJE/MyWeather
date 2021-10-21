Rails.application.routes.draw do
  resources :sessions
# Write your custom routes below: 

  # root route for home page 
  root 'sessions#home'

  #login route 
  get '/login' => 'sessions#new' # this route displays the login page 
  post '/login' => 'sessions#create' # this route processes the login information 

  #logout route 
  delete '/logout' => 'sessions#destroy'
  
  # signup routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :comments
  resources :categories
  resources :users
  resources :locations
 
end
