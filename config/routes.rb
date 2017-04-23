Rails.application.routes.draw do


    resources :cities do
      resources :population
    end
  
	root 'home#index'

  post '/cities/new', controller: 'cities', action: 'new'

  delete 'city', controller: 'cities', action: 'destroy'

  put 'city', controller: 'cities', action: 'update'
	
end
