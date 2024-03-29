require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do
    get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'users/sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

    get 'users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    post 'users', to: 'devise/registrations#create', as: :user_registration
  end
  
  root "books#index"
  resources :books do
    member do
      patch :revert
    end
  end

  resource :site_setting, only: [:edit, :update] do
    put :revert
  end
end
