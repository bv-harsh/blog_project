Rails.application.routes.draw do
	root 'users#index'
	get 'signIn/:user_id', to: 'users#home'
	get 'signIn', to: 'users#signIn'
	get 'all', to:'articles#all'
	post 'signIn', to: 'users#validate'
	delete "logout", to: "users#logOut"

	resources :users do
		resources :articles
	end
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
