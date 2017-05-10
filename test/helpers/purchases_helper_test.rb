require 'test_helper'

class PurchasesHelperTest < ActionView::TestCase

  setup do
    @purchase = purchases(:one)
    @user = users(:one)
  end

  test "should return pay user purchase path" do
    assert_not_nil pay_user_purchase_path @purchase
  end

end
