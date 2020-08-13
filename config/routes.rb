Rails.application.routes.draw do
  get "users/dashboard"
  resources :users do
    member do
      get :subscriptions, :subscribers
    end
  end
  resources :audios
  resources :images
  devise_for :users, controllers: {
                       registrations: "registrations",
                     }
  resources :videos
  root "home#index"
  resources :relationships, only: [:create, :destroy]
end
