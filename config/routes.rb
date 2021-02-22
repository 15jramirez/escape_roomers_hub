Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  #log in process 
  get '/auth/tumblr/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :profiles
  # resources :reviews do 
  #   resources :escape_rooms
  # end


  resources :escape_rooms, only:[:index, :show]

  # resources :users, only:[:show] do 
  #   resources :reviews, only:[:show, :index]
  # end
end
