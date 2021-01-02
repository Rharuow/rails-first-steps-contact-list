Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Name controller and action
  root to: "static_pages#index"
  
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'sair', to: 'session#destroy' 

  
  resources :contacts
  resources :users, only:[:new, :create, :show]

end
