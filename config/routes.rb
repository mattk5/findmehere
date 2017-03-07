Rails.application.routes.draw do
	root 'pages#home'	
	get '/about', 	to: 'pages#about'
	get '/contact', to: 'pages#contact'
	get '/signup', 	to: 'users#new'
end
