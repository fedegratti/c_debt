module ExpensesHelper
  def pay_user_expense_path expense
    "/users/#{@user.id}/expenses/#{expense.id}/pay/"
  end
end
