Rails.application.routes.draw do
  get 'sessions/new'

	root 'pages#home'	
	get '/about', 	to: 'pages#about'
	get '/contact', to: 'pages#contact'
	get '/signup', 	to: 'users#new'
	get '/login',	to: 'sessions#new'
	post '/login',	to: 'sessions#create'
	delete '/logout',	to: 'sessions#destroy'
	resources :users

end
