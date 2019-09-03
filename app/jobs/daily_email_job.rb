class DailyEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Daily Email Job Start ::"

    users = User.where("CAST(settings->>'email_notification_enabled' AS BOOL) = true
                        AND settings->>'email_notification_frecuency' = 'every_day'")

    users.each do |user|
      I18n.locale = user.settings['language']

      debts = Debt.owner_debts(user.id).created_after(1.day.ago)
      UserMailer.daily_email(user.id, debts).deliver_now unless debts.empty?
    end

    puts ":: Daily Email Job Stop ::"
  end
end
