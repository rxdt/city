Rails.application.routes.draw do
  apipie
  ActiveAdmin.routes(self)
  devise_for :users,
             path: '',
             skip: [ :registrations ],
             controllers: { invitations: 'users/invitations' },
             path_names: { sign_in: 'login', sign_out: 'logout' }

  as :user do
    get 'login' => 'devise/sessions#new', as: 'login'
    delete 'logout' => 'devise/sessions#destroy', as: 'logout'
    get 'signup' => 'devise/registrations#new', as: 'signup'
    get 'my_ads' => 'users#my_ads'
  end

  authenticated :user do
    root :to => 'screens#index', :as => :authenticated_root
  end
  root :to => 'landing_page#index', :as => :root

  resources :users, only: [ :show ]
  resource :account, only: [ :edit, :update ], controller: :account
  resources :screens, only: [ :index, :show ]
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [ :create ]
    end
  end
end
