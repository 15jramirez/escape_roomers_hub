Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  #account routes
  get '/auth/tumblr/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :profiles do
    resources :reviews
    #localhost/profile/1/review/new
  end

  resources :escape_rooms do 
    resources :reviews 
    # if review is nested in escpe rooms, don't let user create a new check box or select. 
    #localhost/escape_rooms/review/new
  end
  resources :reviews
  resources :escape_rooms

end
