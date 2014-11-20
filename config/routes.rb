Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  authenticate :user do
    root 'stub#index'
  end

end
