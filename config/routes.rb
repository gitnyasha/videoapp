Rails.application.routes.draw do
  get "users/dashboard"
  resources :users, :only => [:show]
  resources :audios
  resources :images
  devise_for :users, controllers: {
                       registrations: "registrations",
                     }
  resources :videos
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
