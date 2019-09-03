class WeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Weekly Email Job Start ::"

    users = User.where("CAST(settings->>'email_notification_enabled' AS BOOL) = true
                        AND settings->>'email_notification_frecuency' = 'every_week'")

    users.each do |user|
      I18n.locale = user.settings['language']

      debts = Debt.owner_debts(user.id).created_after(1.week.ago)
      UserMailer.weekly_email(user.id, debts).deliver_now unless debts.empty?
    end

    puts ":: Weekly Email Job Stop ::"
  end
end
