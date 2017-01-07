Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' },
                     path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
                     
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'users/sessions#new'
  end

  namespace :admin do
    resource  :dashboard, only: [:show]
    resources :users
    resources :professors
    resources :subjects
    resources :exams
    resources :signups
  end

  resources :professors, only: [:index]
  resources :subjects, only: [:index]
  resources :exams, only: [:index]
  resources :signups, only: [:create, :destroy]
  resources :posts
  resources :comments, only: [:create]
  resources :users, only: [:show, :edit, :update]
  resource  :about, only: [:show]
end
