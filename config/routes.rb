Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users',      to: 'users/registrations#new'
    post 'users',     to: 'users/registrations#create'
    get 'addresses',  to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'products#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users do
    collection do
      get "show"
      get "card"
      get "delivary_address"
      get "user_information"
    end
  end

end
