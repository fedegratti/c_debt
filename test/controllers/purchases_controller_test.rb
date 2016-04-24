require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  setup do
    @purchase = purchases(:one)
  end

  # test "should create purchase" do
  #   assert_difference('Purchase.count') do
  #     post :create, purchase: { amount: @purchase.amount, name: @purchase.name }
  #   end

  #   assert_redirected_to purchase_path(assigns(:purchase))
  # end

  # test "should update purchase" do
  #   patch :update, id: @purchase, purchase: { amount: @purchase.amount, name: @purchase.name }
  #   assert_redirected_to user_purchase_path(assigns(:purchase))
  # end

  # test "should destroy purchase" do
  #   assert_difference('Purchase.count', -1) do
  #     delete :destroy, id: @purchase
  #   end

  #   assert_redirected_to purchases_path
  # end
end
