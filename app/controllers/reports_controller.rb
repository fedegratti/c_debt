class ReportsController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.current_users.reject{|user| user.id == current_user.id }
  end

end
