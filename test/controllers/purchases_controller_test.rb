require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  setup do
    @purchase = purchases(:one)
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post :create, params: { user_id: @purchase.user.id, purchase: { amount: @purchase.amount, name: @purchase.name, user: [@purchase.user.id] } }
    end

    assert_redirected_to user_purchases_path(@purchase.user.id)
  end

  test "should update purchase" do
    patch :update, params: { id: @purchase, user_id: @purchase.user.id, purchase: { amount: @purchase.amount, name: @purchase.name } }
    assert_redirected_to user_purchases_url
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete :destroy, params: { id: @purchase, user_id: @purchase.user.id }
    end

    assert_redirected_to user_purchases_url
  end
end
