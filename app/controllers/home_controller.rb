class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @debts = Debt.where owner_id: current_user.id
  end

  private

end
