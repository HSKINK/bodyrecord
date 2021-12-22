Rails.application.routes.draw do
  devise_for :users
  root to: 'fats#index'
  resources :fats, only: [:index, :new, :create, :destroy, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
