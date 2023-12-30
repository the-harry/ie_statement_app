Rails.application.routes.draw do
  resources :statements
  devise_for :customers
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'statements#index'
end
