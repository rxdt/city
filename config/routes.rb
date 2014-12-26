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

    get 'users/:id/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    get 'users/:id' => 'devise/registrations#show', as: 'show_user_registration'

    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end

  authenticate :user do
    resources :screens, only: [ :index ]

    root 'screens#index'
  end
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [ :create ]
    end
  end
end
