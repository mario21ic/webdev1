Rails.application.routes.draw do
  get 'reportes/index'
  get 'home/index'
  get 'home/nosotros'
  get 'home/acceder'
  get 'home/contactenos'

  root "home#index"

  get 'nosotros', controller: :home, action: :nosotros, alias: 'nosotros'
  get 'contactenos', controller: :home, action: :contactenos, alias: 'contactenos'
  get 'ultimos_proyectos', controller: :home, action: :proyectos, alias: 'proyectos'
  get 'acceder', controller: :home, action: :acceder, alias: 'acceder'
  
  resources :caracteristicas_proyectos
  resources :usuarios
  resources :variables
  resources :movimimiento_venta
  resources :venta
  resources :clientes
  resources :cita
  resources :proformas
  resources :solicituds
  resources :personas
  resources :archivos
  resources :departamentos
  resources :proyectos
  resources :reportes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
