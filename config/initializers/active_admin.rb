ActiveAdmin.setup do |config|
  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  config.site_title = ENV['APP_NAME']

  # This setting changes the method which Active Admin calls
  # within the application controller.
  config.authentication_method = :authenticate_admin!

  # == Logging Out
  #
  # Active Admin displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  config.logout_link_path = :destroy_admin_user_session_path

  # == Batch Actions
  #
  # Enable and disable Batch Actions
  #
  config.batch_actions = true

  # == Localize Date/Time Format
  #
  # Set the localize format to display dates and times.
  # To understand how to localize your app with I18n, read more at
  # https://github.com/svenfuchs/i18n/blob/master/lib%2Fi18n%2Fbackend%2Fbase.rb#L52
  #
  config.localize_format = :long

  # == Filters
  #
  # By default the index screen includes a "Filters" sidebar on the right
  # hand side with a filter for each attribute of the registered model.
  # You can enable or disable them for all resources here.
  #
  # config.filters = true
  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.admin?
  end
end

