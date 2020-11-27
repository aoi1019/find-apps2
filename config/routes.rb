Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "apps#index"
  resources :apps, except: :index do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end