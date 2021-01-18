Rails.application.routes.draw do
  root 'static#home'
  resources :managers, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
