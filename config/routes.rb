# frozen_string_literal: true

Rails.application.routes.draw do
  get 'session/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :logout, to: 'session#destroy'
  get :login, to: 'session#new'
  root to: 'tests#index'

  resources :users, only: :create
  resources :session, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
