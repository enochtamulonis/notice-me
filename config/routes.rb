Rails.application.routes.draw do
  devise_for :users
  resources :notices
  resources :chats
  post '/users/search', to: 'users#search', as: :user_search
  get '/users/easy_add', to: 'users#new', as: :new_user
  post '/users/easy_create', to: 'users#create', as: :users
  root 'notices#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
