Rails.application.routes.draw do
  resources :schools
  resources :courses

  get 'home/index'

  root 'home#index'

  get 'schools/:id/courses' => 'courses#index'
  get 'schools/:id/courses/new' => 'courses#new'

  post 'schools/:id/courses/create' => 'courses#create'
end
