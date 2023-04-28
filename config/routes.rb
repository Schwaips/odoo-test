Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  get 'about', to: 'pages#about'

  namespace :odoo do
    get 'odoo_authorization', to: 'odoo_oauth#odoo_authorization'
    # resources :object_retrievers, only: [:index]
    get 'index', to: 'object_retrievers#index'
  end
end
