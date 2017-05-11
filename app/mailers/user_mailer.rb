class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def instant_email(user_id, debt)
    @user = User.find(user_id)
    @debt = debt
    @url = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t(:instant_email_subject)}")
  end

  def daily_email(user_id, debts)
    @user = User.find(user_id)
    @debts = debts
    @url = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t('daily_debts')}")
  end

  def weekly_email(user_id, debts)
    @user = User.find(user_id)
    @debts = debts
    @url = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t('weekly_debts')}")
  end

  def monthly_report_email(user_id, debts, paid_expenses, unpaid_expenses)
    @user = User.find(user_id)
    @debts = debts
    @paid_expenses = paid_expenses
    @unpaid_expenses = unpaid_expenses
    @url = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t('monthly_report_of', month: t( (Time.now - 1.month).strftime("%B") ))}")
  end
end
