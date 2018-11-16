Rails.application.routes.draw do
  get 'users/new'
  get 'status/save'
  get 'status/delete'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'user/index'
  get '/signup', to: 'users#new'
  get 'user/edit'
  get 'user/delete'
  get 'welcome/index'

  # resources :articles
  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
