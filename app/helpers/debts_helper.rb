module DebtsHelper
  def pay_user_debt_path debt
    "/users/#{@user.id}/debts/#{debt.id}/pay/"
  end
end
