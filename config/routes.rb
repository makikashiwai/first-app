Rails.application.routes.draw do
  devise_for :users

  get 'products/index'
  root 'products#index'

end
