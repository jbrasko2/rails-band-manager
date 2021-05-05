Rails.application.routes.draw do
  root 'static#home'

  resources :managers, except: :index do
    resources :bands, only: [:new, :show, :index, :edit]
  end

  resources :bands
  resources :members
  resources :band_members
  
  get '/auth/facebook/callback', to: "session#omniauth"
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
