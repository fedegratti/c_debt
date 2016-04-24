require 'test_helper'

class DebtsControllerTest < ActionController::TestCase
  setup do
    @debt = debts(:one)
  end

  # test "should create debt" do
  #   assert_difference('Debt.count') do
  #     post :create, debt: { amount: @debt.amount, title: @debt.title }
  #   end

  #   assert_redirected_to user_debt_path(assigns(:debt))
  # end

  # test "should update debt" do
  #   patch :update, id: @debt, debt: { amount: @debt.amount, title: @debt.title }
  #   assert_redirected_to user_debt_path(assigns(:debt))
  # end

  # test "should destroy debt" do
  #   assert_difference('Debt.count', -1) do
  #     delete :destroy, id: @debt
  #   end

  #   assert_redirected_to debts_path
  # end
end
