class WeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Weekly Email Job Start ::"

    users = User.notification_enabled_users('every_week')

    users.each do |user|
      I18n.locale = user.settings['language']

      debts = Debt.owner_debts(user.id).select{ |debt| debt.created_at > 1.week.ago }
      UserMailer.weekly_email(user.id, debts).deliver_now unless debts.empty?
    end

    puts ":: Weekly Email Job Stop ::"
  end
end
