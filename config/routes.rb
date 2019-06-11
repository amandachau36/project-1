Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# All CRUD routes except for index
resources :users, except: [:index, :show]
get '/profile' => 'users#show', as: 'user_profile'

resources :schedules


resources :bookings, except: [:index, :show, :create, :new]

get '/bookings' => 'bookings#show'
get '/bookings/:id/add' => 'bookings#create', as: 'new_booking'



# login form
get '/login' => 'session#new'

post '/login' => 'session#create'

delete '/login' => 'session#destroy'

end
