class MonthlyReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Monthly Report Job Start ::"

    users = User.where("CAST(settings->>'email_notification_enabled' AS BOOL) = true")

    users.each do |user|
      I18n.locale = user.settings['language']

      paid_expenses = Expense.where(user_id: user.id).paid(true).in_last_month
      unpaid_expenses = Expense.where(user_id: user.id).paid(false).in_last_month

      debts = Debt.where(owner_id: user.id).paid(false).created_after(1.month.ago)

      unless debts.empty? && paid_expenses.empty? && unpaid_expenses.empty?
        UserMailer.monthly_report_email(user.id, debts, paid_expenses, unpaid_expenses).deliver_now
      end
    end

    puts ":: Monthly Report Job Stop ::"
  end
end
