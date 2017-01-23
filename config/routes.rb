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
    resources :users, except: [:new, :create]
    resources :professors
    resources :subjects
    resources :exams, except: [:show]
    resources :signups, except: [:show]
    resources :evaluations, except: [:show]
  end

  resources :professors, only: [:index]
  resources :subjects, only: [:index]
  resources :exams, only: [:index]
  resources :signups, only: [:index, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resource  :about, only: [:show]
  
end
