Rails.application.routes.draw do
	root 'users#index'
	get 'sign_in/:user_id', to: 'users#home'
	get 'sign_in', to: 'users#sign_in'
	get 'all', to:'articles#all'
	post 'sign_in', to: 'users#validate'
	delete "log_out", to: "users#log_out"

	resources :users do
		resources :articles
	end
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
