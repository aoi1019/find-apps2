Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "apps#index"
  resources :apps, except: :index do
    resources :comments, only: [:create, :destroy]
  end
  post "likes/:app_id/create" => "likes#create"
  delete "likes/:app_id/destroy" => "likes#destroy"
  resources :users, only: :show
end