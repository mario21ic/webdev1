Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
