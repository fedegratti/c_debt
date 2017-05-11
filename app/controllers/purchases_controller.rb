class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :pay, :destroy]
  before_action :set_user, only: [:new, :index, :edit, :create]
  before_action :set_users, only: [:new, :edit]
  before_action :clean_select_multiple_params, only: [:create]

  # GET /users/1/purchases
  def index
    @purchases = Purchase.where user_id: current_user.id, paid: false
  end

  # GET /users/1/purchases/1
  def show
  end

  # GET /users/1/purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /users/1/purchases/1/edit
  def edit
  end

  # POST /users/1/purchases
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = params.require :user_id

    if @purchase.save
      @to_users = (params.require :purchase)[:user]

      @to_users.each do |user_id|
        @debt = Debt.new()
        @debt.user_id = params.require :user_id

        @debt.title = (params.require :purchase)[:name]
        @debt.amount = ((Float((params.require :purchase)[:amount]) / (@to_users.size + 1))).ceil

        @debt.owner_id = Integer (user_id)
        @debt.purchase_id = @purchase.id
        @debt.save

        owner_user = User.find(user_id)

        # Tell the UserMailer to send a welcome email after save
        if owner_user.settings['email_notification_enabled'] && owner_user.settings['email_notification_frecuency'] == 'instantly'
          UserMailer.instant_email(user_id, @debt).deliver_later
        end
      end

      redirect_to user_purchases_path(params.require :user_id), notice: t('was_successfully_created_f',name: t('purchase'))
    else
      render :new
    end
  end

  # PATCH/PUT /users/1/purchases/1
  def update
      if @purchase.update(purchase_params)
        redirect_to user_purchases_url, notice: t('was_successfully_updated_f', name: t('purchase'))
      else
        render :edit
      end
  end

  # GET /users/1/purchases/1/pay
  def pay
    @purchase.paid = true
    if @purchase.save
      @purchase.debts.each do |debt|
        debt.paid = true
        debt.save
      end
      redirect_to user_purchases_url, notice: t('was_marked_as_paid_f', name: t('purchase'))
    else
      redirect_to user_purchases_url, error: t('was_not_marked_as_paid_f', name: t('purchase'))
    end
  end

  # DELETE /users/1/purchases/1
  def destroy
    @purchase.destroy
    redirect_to user_purchases_url, notice: t('was_successfully_destroyed_f', name: t('purchase'))
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
      @users = (@user.friends.where.not(id: current_user.id).where(deleted_at: nil)).pluck(:name, :id)
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
