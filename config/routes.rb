Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'signup_create'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'login_create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root 'users#index'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
