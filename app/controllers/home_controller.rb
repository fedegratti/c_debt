class HomeController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    cookies[:language] = current_user.settings['language']
    set_locale

    @debts = Debt.where owner_id: current_user.id, paid: false
    @users = current_user.friends

    @user_debts = Debt.select('owner_id, SUM(amount) as amount').where(user_id: current_user.id).paid(false).group(:owner_id)
    @user_expenses = current_user.expenses.in_last_month

    @unpaid_expenses = Expense.where(user_id: current_user.id).paid(false).in_last_month
  end

end
