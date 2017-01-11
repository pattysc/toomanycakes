Rails.application.routes.draw do
  #root
  root 'users#login'
  #user
  resources :users
  get '/users/:id/cook', to: "users#cook", as: "cook"
  get '/user/:id/claimed_meals', to: "users#claimed_meals", as: "claimed_meals"
  #sessions
  resources :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups, only: [:index, :show, :new, :create]
  post 'groups/join', to: 'groups#join', as: 'join'
  post 'groups/quit', to: 'groups#quit', as: 'quit'





  #**********************MEALS ROUTING************************
  post '/meals', to: 'meals#create', as: "create_meal"
  get '/meals', to: 'meals#index', as: "meals"
  get '/meals/new', to: 'meals#new', as: "new_meal"
  get '/meals/:id', to: 'meals#show', as: "meal"

  post '/portions', to: 'portions#update'
  post '/portions/return', to: 'portions#return', as: "return"
end
