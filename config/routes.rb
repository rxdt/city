Rails.application.routes.draw do

  devise_for :users

  root 'stub#index'

end
