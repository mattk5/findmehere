Rails.application.routes.draw do
	root 'find_me_app#home'	
	get '/about', 	to: 'find_me_app#about'
	get '/contact', to: 'find_me_app#contact'
end
