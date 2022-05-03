Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'project#index'
  resources :projects
  resources :organizations
  resources :budgets
  resources :departments
  resources :offices
  resources :persons
  # resources :projects, only: [:show]
end
