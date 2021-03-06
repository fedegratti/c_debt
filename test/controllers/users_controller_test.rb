require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new, params: { user: @user }
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post :create, user: { name: "3", email: "test3@test.com" }
  #   end

  #   assert_redirected_to user_path(assigns(:user))
  # end

  test "should show user" do
    get :show, params: { id: @user }
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, params: { id: @user }
    assert_response :success
  end

  test "should update user" do
    patch :update, params: { id: @user, user: {name: "name_updated"} }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do

    assert_difference('User.count', 0) do
      delete :destroy, params: { id: @user }
    end

    assert User.find(@user.id).is_deleted?.to_s
    assert_redirected_to users_path

  end
end
