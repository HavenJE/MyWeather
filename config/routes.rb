Rails.application.routes.draw do
# Write your custom routes below: 

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :comments
  resources :categories
  resources :users
  resources :locations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
