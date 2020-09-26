Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contents
  resources :comments
  resources :reviews
  resources :properties
  resources :users
end
