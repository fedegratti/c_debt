class SettingsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_settings, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  # GET /settings
  def edit
    unless @user.settings.nil?
      @language = @user.settings['language']
      @email_notification_enabled = @user.settings['email_notification_enabled']
      @email_notification_frecuency = @user.settings['email_notification_frecuency']
    end
  end

  # PATCH/PUT /settings
  def update
    @user.settings = {} if @user.settings.nil?
    @user.settings[:email_notification_enabled] = params[:email_notification_enabled].to_b
    @user.settings[:email_notification_frecuency] = params[:email_notification_frecuency]
    @user.settings[:language] = params[:language]
    @user.save! # saves new or changed settings, too
    cookies[:language] = params[:language]
    set_locale
    redirect_to settings_url, notice: t('settings_successfully_saved')
  end

  private

  def set_user
    @user = current_user
  end
end
