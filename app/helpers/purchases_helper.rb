module PurchasesHelper
  def pay_user_purchase_path purchase
    "/users/#{@user.id}/purchases/#{purchase.id}/pay/"
  end
end
