require 'test_helper'

class ExpensesHelperTest < ActionView::TestCase

  setup do
    @expense = expenses(:one)
    @user = users(:one)
  end

  test "should return pay user expense path" do
    assert_not_nil pay_user_expense_path @expense
  end

end
