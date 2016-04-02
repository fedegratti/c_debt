class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :pay, :destroy]
  before_action :set_users, only: [:new, :edit, :create, :update]
  before_action :set_user, only: [:index, :edit, :create]

  # GET /debts
  def index
    @debts = Debt.where user_id: current_user.id, paid: false
  end

  # GET /debts/1
  def show
  end

  # GET /debts/new
  def new
    @debt = Debt.new
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts
  def create
    @debt = Debt.new(debt_params)
    @debt.user_id = params.require :user_id

    if @debt.save
      redirect_to user_debts_path(params.require :user_id), notice: 'Debt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /debts/1
  def update
      if @debt.update(debt_params)
        redirect_to user_debts_url, notice: 'Debt was successfully updated.'
      else
        render :edit
      end
  end

  # GET /debts/1/pay
  def pay
    @debt.paid = true
    if @debt.save
        redirect_to user_debts_url, notice: 'Debt was marked as paid.'
    end
  end

  # DELETE /debts/1
  def destroy
    @debt.destroy
    redirect_to user_debts_url, notice: 'Debt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:title, :amount, :owner_id)
    end

    def set_user
      @user = User.find(params.require :user_id)
    end

    def set_users
      @users = User.pluck(:name, :id)
    end

end
