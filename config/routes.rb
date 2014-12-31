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
  end

  authenticated :user do
    root :to => 'users#create_ad', :as => :authenticated_root
  end
  root :to => 'landings#welcome', :as => :root

  resources :users, only: [ :show ]
  resources :user_steps
  resource :account, only: [ :edit, :update ], controller: :account
  resources :screens, only: [ :index, :show ]
  as :landings do
    get 'thank_you' => 'landings', as: 'thank_you'
    get 'faq' => 'landings', as: 'faq'
  end
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [ :create ]
    end
  end
end
