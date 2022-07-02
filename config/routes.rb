Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home" 
  get "about", to: "pages#about" # to: especifica a quien le hacemos el request (al controlador pages), about es la accion

  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] # crea las rutas para todos los articulos
  resources :articles # crea TODAS las rutas de arriba

  get "signup", to: "users#new" # creates 'signup' page to users(controller) and new(action)
  # post "users", to: "users#create" # the 'new form submission' is handled by the 'create action'
  resources :users, except: [:new] # crea las rutas para todos los usuarios excepto el new (a la que llamamos 'signup')

  get "login", to: "sessions#new" # creates 'login' page to sessions(controller) and new(action)
  post "login", to: "sessions#create" # the 'new form submission' is handled by the 'create action'
  delete "logout", to: "sessions#destroy" # creates 'logout' page to sessions(controller) and destroy(action)

end
