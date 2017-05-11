class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_candidate_friends

  # GET /users/1/friends
  def index
  end

  # GET /users/1/friends/candidate
  def candidate
    clue = params[:clue]
    @candidate_friends = @candidate_friends.where("name like ? or email like ?", "%#{clue}%", "%#{clue}%")
    render :layout => false
  end

  # POST /users/1/friends/add
  def add
    @user.friends << Friend.find(params[:friend_id])
    if @user.save
      redirect_to user_friends_path(@user.id), notice: t('was_successfully_added',name: t('friend'))
    else
      render :new, notice: t('was_not_successfully_added',name: t('friend'))
    end
  end

  # DELETE /users/1/friends
  def destroy
    @user.friends.delete(Friend.find(params[:id]))
    redirect_to user_friends_url, notice: t('was_successfully_destroyed_m', name: t('friend'))
  end

  private

  def set_user
    @user = User.find(params.require :user_id)
  end

  def set_candidate_friends
    @candidate_friends = Friend.where(id: (User.where(deleted_at: nil).pluck(:id) - @user.friends.pluck(:id))).where.not(id: @user.id)
  end

end
