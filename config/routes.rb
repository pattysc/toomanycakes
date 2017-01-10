Rails.application.routes.draw do
  #root
  root 'users#index'
  #user
  resources :users
  #sessions
  resources :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
