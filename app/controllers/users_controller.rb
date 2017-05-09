class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.where deleted_at: nil
  end

  # GET /users/1
  def show
    redirect_to '/'
  end

  #GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users
  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     redirect_to @user, notice: 'User was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        redirect_to @user, notice: t('was_successfully_updated',name: t('user'))
      else
        render :edit
      end
  end

  # DELETE /users/1
  # def destroy
  #   @user.soft_delete
  #   Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end

  # Make someone admin
  # def make_admin
  #   @user = User.where("email like ?", "%" + params[:email] + "%").take
  #   @user.admin = true
  #   @user.save
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
