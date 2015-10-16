Rails.application.routes.draw do
  devise_for :users

  root 'visitors#index'

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :teachers

  resources :visitors, only: [:index]

  get 'report/subjects' => 'reports#subjects'
end
