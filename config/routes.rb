Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :trainings, only: [:index, :create, :update, :destroy]
      post 'login', to: 'sessions#create'
    end
  end
end
