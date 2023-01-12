Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items do
    resources :purchase_logs, only: [:index, :new, :create]
  end

  root to: 'items#index'

end
