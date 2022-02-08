Rails.application.routes.draw do
  devise_for :users
  root to: 'fats#show'
  resources :fats
  resources :bodies, :nutrients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
