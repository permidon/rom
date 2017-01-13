Rails.application.routes.draw do
  resources :routes
  resources :tickets
  resources :cars, only: [:index]
  resource :search, only: [:create, :show]

  resources :trains do
    resources :cars, shallow: true
    resources :sleeping_car, controller: 'cars', shallow: true
    resources :coupe_car, controller: 'cars', shallow: true
    resources :economy_car, controller: 'cars', shallow: true
    resources :sedentary_car, controller: 'cars', shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
