Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users/login' => 'auth#create'
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations'
      }
    end
  end

  root to: "trainings#index"
  get 'search', action: :search, controller: :application

  # devise_for :users, skip: [ :sessions ]
  # devise_scope :user do
  #   get 'login' => 'sessions#new', :as => :new_user_session
  #   post 'login' => 'sessions#create', :as => :user_session
  #   get 'logout' => 'sessions#destroy', :as => :destory_user_session
  # end

  resources :trainings do 
    resources :workout_sets 
  end
  resources :workout_sets 

  resources :projects do |project|
    get :permission_policy

    resources :posts do |post|
      member do

      end
    end

  end

  resources :audits

  # API
  post 'projects/permission' => 'projects#permission'


end
