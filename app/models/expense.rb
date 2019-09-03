class Expense
  field :name,    type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean, default: false

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def self.paid_expenses(user_id)
    Expense.select{ |expense| expense.user_id == user_id && expense.paid == true }
  end

  def self.unpaid_expenses(user_id)
    Expense.select{ |expense| expense.user_id == user_id && expense.paid == false }
  end

  def self.in_last_month(expenses)
    expenses.select{ |expense| expense.created_at > 1.month.ago }
  end

end
