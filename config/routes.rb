Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'home#home'
	devise_for :users

	get '/service-worker.js' => "service_worker#service_worker"
	get '/manifest.json' => "service_worker#manifest"
	get '/offline.html' => "service_worker#offline"

	resources :packages do
		patch '/finished' => "packages#finished"
		collection do
			patch :sort
		end
	end
	resources :teams
	resources :team_memberships, only: [:create, :destroy]
	resources :users, only: [:index]

	resources :assigments, only: [:update]

	resources :finished_packages, only: [:index]
end
