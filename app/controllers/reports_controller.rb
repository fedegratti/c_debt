class ReportsController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.where.not(id: current_user.id).where deleted_at: nil
  end

end
