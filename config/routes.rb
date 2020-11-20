Rails.application.routes.draw do
  devise_for :users
  root "apps#index"
  resources :apps, only: [:new, :create]
end