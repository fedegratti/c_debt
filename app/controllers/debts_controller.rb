class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit, :create, :update]
  before_action :set_user, only: [:index, :edit, :create]

  # GET /debts
  # GET /debts.json
  def index
    @debts = @user.debts
  end

  # GET /debts/1
  # GET /debts/1.json
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
  # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to @debt, notice: 'Debt was successfully updated.' }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to debts_url, notice: 'Debt was successfully destroyed.' }
      format.json { head :no_content }
    end
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
