Rails.application.routes.draw do
  resources :audios
  resources :images
  get "profiles/dashboard"
  get "profiles/show"
  devise_for :users, controllers: {
                       registrations: "registrations",
                     }
  resources :videos
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
