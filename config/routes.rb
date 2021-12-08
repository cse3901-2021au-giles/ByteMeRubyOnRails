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
  get 'class_sessions/add_user_to_class'
  resources :users 
  resources :evaluations
  resources :class_sessions do
    collection do
      post 'add_user_to_class'
      post 'add_user_to_group'
    end
  end
  resources :projects do
    collection do
      post 'generate_evaluations'
    end
  end
  resources :groups
end
