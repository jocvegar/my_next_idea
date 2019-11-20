Rails.application.routes.draw do
  root 'home#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
  get '/offline.html' => "service_worker#offline"
  resources :packages
end

