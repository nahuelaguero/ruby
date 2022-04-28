Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "project#index"

  
  resources :projects, only: [:show, :index, :new, :create, :edit, :update]
  # resources :projects, only: [:show]
end
