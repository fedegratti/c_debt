class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :current_user
  helper_method :authenticate_user!

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def set_locale
    I18n.locale = cookies[:language] || extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
  end

end
