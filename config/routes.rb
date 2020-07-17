Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  #       ↑localhost:3000の時に表示する場所を指定する。
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end
