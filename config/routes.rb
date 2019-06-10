Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# All CRUD routes except for index
resources :users, except: [:index]
resources :schedules

# login form
get '/login' => 'session#new'

post '/login' => 'session#create'

delete '/login' => 'session#destroy'

end
