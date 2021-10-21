Rails.application.routes.draw do
  
# Write your custom routes below: 

  # root route for home page 
  root 'sessions#home'

  # signup routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route 
  get '/login' => 'sessions#new' # this route displays the login page 
  post '/login' => 'sessions#create' # this route processes the login information 

  #logout route 
  delete '/logout' => 'sessions#destroy' # called it delete as we are deleting the session to log out - also, so that the user can't view it in the browser bar 
  
 

  resources :comments
  resources :categories
  resources :users
  resources :locations
  resources :sessions
end
