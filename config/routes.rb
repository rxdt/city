Rails.application.routes.draw do
  apipie
  ActiveAdmin.routes(self)
  devise_for :users,
             skip: [ :registrations ],
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout'}

  as :user do
    get 'login' => 'devise/sessions#new', as: 'login'
    delete 'logout' => 'devise/sessions#destroy', as: 'logout'
  end

  resources :users, only: [ :show ]
  resource :account, only: [ :edit, :update ], controller: :account
  get 'my_ads' => 'users#my_ads'

  resources :screens, only: [ :index, :show ]

  root 'screens#index'
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [ :create ]
    end
  end
end
