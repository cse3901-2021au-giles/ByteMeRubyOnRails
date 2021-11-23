Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/evaluation', to: 'static_pages#evaluation'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  resources :users
end
