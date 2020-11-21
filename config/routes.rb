Rails.application.routes.draw do
  devise_for :users
  root "apps#index"
  resources :apps, except: :index
end