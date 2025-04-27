Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :exersizes, only: [:index, :create]
      get 'exersizes/body_parts', to: 'exersizes#body_parts'
      resources :users, only: [:create]
      resources :trainings, only: [:index, :create, :update, :destroy, :show] do
        resources :workout_sets, only: [:index, :create, :update, :destroy]
      end
      post 'login', to: 'sessions#create'
    end
  end
end
