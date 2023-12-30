Rails.application.routes.draw do
  devise_for :customers
  get 'up' => 'rails/health#show', as: :rails_health_check

  # root 'posts#index'
end
