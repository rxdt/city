Rails.application.routes.draw do
  apipie
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end

  authenticate :user do
    root 'stub#index'
    resources :deals, only: [ :index ]
  end
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [ :create ]
    end
  end
end
