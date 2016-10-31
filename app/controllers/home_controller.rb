class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users, only: [:index]

  # GET /users
  def index
    @debts = Debt.where owner_id: current_user.id, paid: false
    @user_debts = Debt.select('owner_id, SUM(amount) as amount').where(user_id: current_user.id, paid: false).group(:owner_id)
    #@user_debts = Debt.where user_id: current_user.id, paid: false
  end

  private

  def set_users
    @users = User.where.not(id: current_user.id).where deleted_at: nil
  end
end
