Rails.application.routes.draw do
  get 'projects/index'
  get 'groups/index'
  root 'static_pages#home'
  get 'sessions/new'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :evaluations
  resources :class_sessions
end
