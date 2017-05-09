require 'test_helper'

class DebtsControllerTest < ActionController::TestCase
  setup do
    @debt = debts(:one)
  end

  test "should create debt" do
    assert_difference('Debt.count') do
      post :create, params: { user_id: @debt.user.id, debt: { amount: @debt.amount, title: @debt.title, owner_id: @debt.user.id } }
    end

    assert_redirected_to user_debts_path(@debt.user.id)
  end

  test "should update debt" do
    patch :update, params: { id: @debt, user_id: @debt.user.id, debt: { amount: @debt.amount, title: "new_title", owner_id: @debt.user.id } }

    edited_debt = Debt.find(@debt.id)

    assert_equal edited_debt.title, 'new_title'
    assert_redirected_to user_debts_url
  end

  test "should destroy debt" do
    assert_difference('Debt.count', -1) do
      delete :destroy, params: { id: @debt, user_id: @debt.user.id }
    end

    assert_redirected_to user_debts_path
  end
end
