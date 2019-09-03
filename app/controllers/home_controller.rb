class HomeController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    cookies[:language] = current_user.settings['language']
    set_locale

    @debts = Debt.owner_debts(current_user.id)
    @users = current_user.friends

    @user_debts = Debt.select('owner_id, SUM(amount) as amount').where(user_id: current_user.id).paid(false).group(:owner_id)
    @user_expenses = Expense.in_last_month(current_user.expenses)

    @unpaid_expenses = Expense.in_last_month(Expense.unpaid_expenses(current_user.id))
  end

end
