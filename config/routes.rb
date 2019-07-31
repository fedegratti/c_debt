Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  get 'users/:user_id/friends/candidate' => 'friends#candidate'

  resources :users do
    resources :debts
    resources :friends
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

  post 'users/:user_id/friends/add/:friend_id' => 'friends#add'

  get 'admin/reports' => 'reports#index'

end
