class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user_id, debt)
    @user = User.find(user_id)
    @debt = debt
    @url  = 'https://cdebt.herokuapp.com/'
    mail(to: @user.email, subject: 'You have a new debt from cDebt')
  end
end
