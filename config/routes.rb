Rails.application.routes.draw do
  root 'static#home'
  resources :managers, only: [:new, :edit, :show, :destroy, :create]
  resources :bands

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session/', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
