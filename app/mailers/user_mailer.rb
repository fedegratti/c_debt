class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def instant_email(user_id, debt)
    @user = User.find(user_id)
    @debt = debt
    @url  = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t(:instant_email_subject)}")
  end

  def daily_email(user_id, debts)
    @user = User.find(user_id)
    @debts = debts
    @url  = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t('daily_debts')}")
  end

  def weekly_email(user_id, debts)
    @user = User.find(user_id)
    @debts = debts
    @url  = ENV['APP_URL']
    mail(to: @user.email, subject: "#{ENV['APP_NAME']} | #{t('weekly_debts')}")
  end
end
