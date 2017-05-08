Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  #devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do
    resources :debts
    resources :expenses
    resources :purchases
  end

  get 'users/:user_id/debts/:id/pay' => 'debts#pay'
  get 'users/:user_id/expenses/:id/pay' => 'expenses#pay'
  get 'users/:user_id/purchases/:id/pay' => 'purchases#pay'

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'settings' => 'settings#edit'
  post 'settings/update' => 'settings#update'

end
