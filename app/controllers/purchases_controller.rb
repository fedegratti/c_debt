class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit, :create, :update]
  before_action :set_user, only: [:index, :edit, :create]
  before_action :clean_select_multiple_params, only: [:create]

  # GET /purchases
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      @to_users = (params.require :purchase)[:user]

      @to_users.each do |user_id|
        @debt = Debt.new()
        @debt.user_id = params.require :user_id

        @debt.title = (params.require :purchase)[:name]
        @debt.amount = ((Float((params.require :purchase)[:amount]) / (@to_users.size + 1))).ceil

        #@debt.owner_id = params.require :owner_id
        @debt.owner_id = Integer (user_id)
        @debt.purchase_id = @purchase.id
        @debt.save
      end

      redirect_to user_purchases_path(params.require :user_id), notice: 'Purchase was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /purchases/1
  def update
      if @purchase.update(purchase_params)
        redirect_to user_purchases_url, notice: 'Purchase was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
    redirect_to user_purchases_url, notice: 'Purchase was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:name, :amount, :user)
    end

    def set_user
      @user = User.find(params.require :user_id)
    end

    def set_users
      @users = User.pluck(:name, :id)
    end

    def clean_select_multiple_params hash = params
      hash.each do |k, v|
        case v
        when Array then v.reject!(&:blank?)
        when Hash then clean_select_multiple_params(v)
        end
      end
    end
end
