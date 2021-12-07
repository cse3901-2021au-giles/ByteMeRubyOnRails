Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/instruction', to: 'static_pages#instruction'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :evaluations
  resources :class_sessions
  resources :projects
  resources :groups
  resources :user_class_x_refs
  resources :user_group_x_refs
end
