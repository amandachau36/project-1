Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root to: 'session#new'


# All CRUD routes except for index
resources :users, except: [:index, :show]
get '/profile' => 'users#show', as: 'user_profile'

resources :schedules

# resources :bookings, except: [:index, :show, :create, :new, :destroy]

get '/bookings' => 'bookings#show'

get '/bookings/:id/:date/add' => 'bookings#create', as: 'new_booking'

get '/bookings/:id/:date/delete' => 'bookings#destroy', as: 'destroy_booking'

get '/bookings/:id/:date/student_details' => 'bookings#details', as: 'details_booking'


# login form
get '/login' => 'session#new'

post '/login' => 'session#create'

delete '/login' => 'session#destroy'

end
