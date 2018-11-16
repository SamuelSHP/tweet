Rails.application.routes.draw do
  get 'users/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'user/index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'user/edit'
  get 'user/delete'
  
  get 'welcome/index'

  # resources :articles
  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
