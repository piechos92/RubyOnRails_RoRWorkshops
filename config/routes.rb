Rails.application.routes.draw do
  get 'payments/index'

  devise_for :users

  root 'visitors#index'

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :visitors, only: [:index]

  resources :payments, only: [:index]

  get 'report/subjects' => 'reports#subjects'
end