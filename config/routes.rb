Rails.application.routes.draw do
  #root
  root 'users#login'
  #user
  get '/users/cook', to: "users#cook", as: "cook"
  resources :users
  get '/users/:id/claimed_meals', to: "users#claimed_meals", as: "claimed_meals"
  #sessions
  resources :sessions, only: [:create, :destroy]
  get '/sessions/logout', to: "sessions#logout", as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups
  post 'groups/join', to: 'groups#join', as: 'join'
  post 'groups/quit', to: 'groups#quit', as: 'quit'




  #**********************MEALS ROUTING************************
  post '/meals', to: 'meals#create', as: "create_meal"
  get '/meals', to: 'meals#index', as: "meals"
  get '/meals/new', to: 'meals#new', as: "new_meal"
  get '/meals/:id', to: 'meals#show', as: "meal"
  get '/meals/:id/edit', to: 'meals#edit', as: "edit_meal"
  patch '/meals/:id', to: 'meals#update'
  delete '/meals/:id/destroy', to: 'meals#destroy', as: 'meal_delete'


  post '/portions', to: 'portions#update'
  post '/portions/return', to: 'portions#return', as: "return"
end
