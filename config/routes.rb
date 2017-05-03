Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  #devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do
    resources :purchases
    resources :debts
  end

  get 'users/:user_id/debts/:id/pay' => 'debts#pay'
  get 'users/:user_id/purchases/:id/pay' => 'purchases#pay'

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'set_language/:language' => 'application#set_language'
end
