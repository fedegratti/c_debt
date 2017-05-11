require 'test_helper'

class DebtsControllerTest < ActionController::TestCase
  setup do
    @debt = debts(:one)
    @user = users(:one)
    sign_in @user
    @debt.user.settings = {}
    @debt.user.settings['email_notification_enabled'] = true
    @debt.user.settings['email_notification_frecuency'] = 'every_day'
    @debt.user.settings['language'] = 'en'
    @debt.user.save
  end

  test "should index debt" do
    get :index, params: { user_id: @debt.user.id }
    assert_response 200
  end

  test "should new debt" do
    get :new, params: { user_id: @debt.user.id }
    assert_response 200
  end

  test "should create debt" do
    assert_difference('Debt.count') do
      post :create, params: { user_id: @debt.user.id, debt: { amount: @debt.amount, title: @debt.title, owner_id: @debt.user.id } }
    end

    assert_redirected_to user_debts_path(@debt.user.id)
  end

  test "should not create debt" do
    assert_difference('Debt.count', 0) do
      post :create, params: { user_id: @debt.user.id, debt: { amount: @debt.amount } }
    end

    assert_response 200
  end

  test "should update debt" do
    patch :update, params: { id: @debt, user_id: @debt.user.id, debt: { amount: @debt.amount, title: "new_title", owner_id: @debt.user.id } }

    edited_debt = Debt.find(@debt.id)

    assert_equal edited_debt.title, 'new_title'
    assert_redirected_to user_debts_url
  end

  test "should not update debt" do
    old_title = @debt.title
    patch :update, params: { id: @debt, user_id: @debt.user.id, debt: { title: "new_title" } }
    not_edited_debt = Debt.find(@debt.id)

    assert_equal not_edited_debt.title, old_title
    assert_response 200
  end

  test "should pay debt" do
    @debt.owner = owners(:owner)
    @debt.save
    get :pay, params: { id: @debt, user_id: @debt.user.id }
    paid_debt = Debt.find(@debt.id)
    assert paid_debt.paid
  end

  test "should not pay debt" do
    @debt.save
    get :pay, params: { id: @debt, user_id: @debt.user.id }
    paid_debt = Debt.find(@debt.id)
    assert_not paid_debt.paid
  end

  test "should destroy debt" do
    assert_difference('Debt.count', -1) do
      delete :destroy, params: { id: @debt, user_id: @debt.user.id }
    end

    assert_redirected_to user_debts_path
  end
end
