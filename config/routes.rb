Rails.application.routes.draw do
  get 'sessions/new'
  resources :variables
  get 'separar/index'
  get 'separar/new'
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
  resources :movimimiento_venta
  resources :separars
  resources :venta
  resources :clientes
  resources :cita
  resources :proformas
  resources :solicituds
  get '/solicituds/new/:departamento_id' => 'solicituds#new'
  resources :personas
  resources :archivos
  resources :departamentos
  resources :proyectos
  resources :reportes
  

  post 'proyectos/new'

  post 'variables/provincias', as: 'provincias'

  get 'departamentos/:cod_proyecto/index'=>'departamentos#index'
  get 'departamentos/:cod_proyecto/new'=>'departamentos#new'
  get 'departamentos/:id/home'=>'departamentos#home'

  get 'archivos/:cod_proyecto/:cod_departamento/index'=>'archivos#index'
  get 'archivos/:cod_proyecto/:cod_departamento/new'=>'archivos#new'

  get 'proyectos/:id/home'=>'proyectos#home'

  get 'signup'     => 'usuarios#new'
  get 'login'      => 'sessions#new'
  post 'login'     => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
