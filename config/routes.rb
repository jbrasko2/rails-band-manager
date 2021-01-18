Rails.application.routes.draw do
  root 'static#home'
  resources :managers, only: [:new, :edit, :show, :destroy, :create]

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
