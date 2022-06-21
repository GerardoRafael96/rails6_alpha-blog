Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home" 
  get "about", to: "pages#about" # to: especifica a quien le hacemos el request (al controlador pages), about es la accion

  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] # crea las rutas para todos los articulos
  resources :articles # crea TODAS las rutas de arriba
end
