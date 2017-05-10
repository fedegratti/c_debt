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
      if @user.settings['email_notification_enabled'] && @user.settings['email_notification_frecuency'] == 'instantly'
        #UserMailer.instant_email(@debt.owner_id, @debt).deliver_now
        UserMailer.instant_email(@debt.owner_id, @debt).deliver_later unless @debt.owner_id == current_user.id
      end

      redirect_to user_debts_path(params.require :user_id), notice: t('was_successfully_created',name: t('debt'))
    else
      render :new
    end
  end

  # PATCH/PUT /debts/1
  def update
      if @debt.update(debt_params)
        redirect_to user_debts_url, notice: t('was_successfully_updated', name: t('debt'))
      else
        render :edit
      end
  end

  # GET /debts/1/pay
  def pay
    @debt.paid = true
    if @debt.save
      redirect_to user_debts_url, notice: t('was_marked_as_paid', name: t('debt'))
    else
      redirect_to user_debts_url, error: t('was_not_marked_as_paid', name: t('debt'))
    end
  end

  # DELETE /debts/1
  def destroy
    @debt.destroy
    redirect_to user_debts_url, notice: t('was_successfully_destroyed', name: t('debt'))
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
      @users = (User.where deleted_at: nil).pluck(:name, :id)
    end
end
