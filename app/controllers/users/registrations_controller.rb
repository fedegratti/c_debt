class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new

    super
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.settings = {} if @user.settings.nil?
    @user.settings[:email_notification_enabled] = true
    @user.settings[:email_notification_frecuency] = 'instantly'
    @user.settings[:language] = 'en'
    respond_to do |format|
      if @user.save
        sign_in(@user, scope: :user)
        format.html { redirect_to @user, notice: t('was_successfully_created_m',name: t('user')) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
