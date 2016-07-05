Rails.application.routes.draw do
  resources :schools
  resources :courses
  resources :users

  root 'home#index'

  get 'schools/:id/courses', to: 'courses#index'
  get 'schools/:id/courses/new', to: 'courses#new'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'schools/:id/courses/create', to: 'courses#create'
end
