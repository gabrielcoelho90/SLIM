Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  resources :users, only: %i[show edit update] do
    resources :meals
  end
end
