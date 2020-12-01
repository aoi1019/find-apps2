Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "apps#index"
  resources :apps, except: :index do
    resources :comments, only: [:create, :destroy]
  end
  post "likes/:app_id/create" => "likes#create"
  delete "likes/:app_id/destroy" => "likes#destroy"
  get :favorites, to: 'favorites#index'
  post   "favorites/:app_id/create"  => "favorites#create"
  delete "favorites/:app_id/destroy" => "favorites#destroy"
  resources :users, only: :show
end