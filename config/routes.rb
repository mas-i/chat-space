Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  #       ↑localhost:3000の時に表示する場所を指定する。
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
