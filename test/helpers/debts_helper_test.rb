require 'test_helper'

class DebtsHelperTest < ActionView::TestCase

  setup do
    @debt = debts(:one)
    @user = users(:one)
  end

  test "should return pay user debt path" do
    assert_not_nil pay_user_debt_path @debt
  end

end
