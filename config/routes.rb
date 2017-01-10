Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html






  #**********************MEALS ROUTING************************
  post '/meals', to: 'meals#create', as: "create_meal"
  get '/meals', to: 'meals#index', as: "meals"
  get '/meals/new', to: 'meals#new', as: "new_meal"
  get '/meals/:id', to: 'meals#show', as: "meal"

  post '/portions', to: 'portions#update'
end
