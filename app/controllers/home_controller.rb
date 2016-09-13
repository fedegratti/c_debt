class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users, only: [:index]

  # GET /users
  def index
    @debts = Debt.where owner_id: current_user.id, paid: false
    @user_debts = Debt.where user_id: current_user.id, paid: false
  end

  private

  def set_users
    @users = User.where.not(id: current_user.id)
  end
end
