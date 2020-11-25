Rails.application.routes.draw do
  devise_for :users
  root "apps#index"
  resources :apps, except: :index do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end