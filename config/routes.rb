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
  
  # Omniauth callback route 
  get '/auth/google_oauth2/callback' => 'sessions#google'
  # get "/auth/ :provider/callback" can use this in case you want to use more than one omniauth 
 
  
  resources :users do 
    resources :locations, only: [:new, :create, :index] # shallow routing can be written shallow: true
  end 

  resources :locations do 
    resources :comments
  end

  resources :comments
  resources :categories
  resources :sessions
end

# Possible nested routes are: 
# For '/users'
# '/users/:id/posts'

# For '/locations'
# 'locations/:id/comments'