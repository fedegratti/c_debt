class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :pay, :destroy]
  before_action :set_user, only: [:index, :edit, :create]

  # GET /expenses
  def index
    @expenses = Expense.where user_id: current_user.id
  end

  # GET /expenses/1
  # def show
  # end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = params.require :user_id

    if @expense.save
      redirect_to user_expenses_path(params.require :user_id), notice: t('was_successfully_created',name: t('expense'))
    else
      render :new
    end
  end

  # PATCH/PUT /expenses/1
  def update
      if @expense.update(expense_params)
        redirect_to user_expenses_url, notice: t('was_successfully_updated', name: t('expense'))
      else
        render :edit
      end
  end

  # GET /debts/1/pay
  def pay
    @expense.paid = true
    if @expense.save
      redirect_to user_expenses_url, notice: t('was_marked_as_paid', name: t('expense'))
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
    redirect_to user_expenses_url, notice: t('was_successfully_destroyed', name: t('expense'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:name, :amount)
    end

    def set_user
      @user = User.find(params.require :user_id)
    end

    # def set_users
    #   @users = (User.where.not(id: current_user.id).where deleted_at: nil).pluck(:name, :id)
    # end

    # def clean_select_multiple_params hash = params
    #   hash.each do |k, v|
    #     case v
    #     when Array then v.reject!(&:blank?)
    #     when Hash then clean_select_multiple_params(v)
    #     end
    #   end
    #end
end
