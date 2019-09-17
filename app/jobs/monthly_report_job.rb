class MonthlyReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Monthly Report Job Start ::"

    users = User.notification_enabled_users('every_month')

    users.each do |user|
      I18n.locale = user.settings['language']

      paid_expenses = Expense.in_last_month(Expense.paid_expenses(user.id))
      unpaid_expenses = Expense.in_last_month(Expense.unpaid_expenses(user.id))

      debts = Debt.owner_debts(user.id).created_after(1.month.ago)

      unless debts.empty? && paid_expenses.empty? && unpaid_expenses.empty?
        UserMailer.monthly_report_email(user.id, debts, paid_expenses, unpaid_expenses).deliver_now
      end
    end

    puts ":: Monthly Report Job Stop ::"
  end
end
