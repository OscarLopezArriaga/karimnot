Rails.application.routes.draw do
  root "categories#index"

  resources :projects
  resources :categories
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
