Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end

  authenticate :user do
    root 'stub#index'
  end

end
