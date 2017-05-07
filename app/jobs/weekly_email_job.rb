class WeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ":: Weekly Email Job Start ::"

    users = User.where("CAST(settings->>'email_notification_enabled' AS BOOL) = true
                        AND settings->>'email_notification_frecuency' = 'every_week'")

    users.each do |user|
      debts = Debt.where("owner_id = #{user.id} AND paid = false")
      UserMailer.weekly_email(user.id, debts).deliver_now unless debts.empty?
    end

    puts ":: Weekly Email Job Stop ::"
  end
end
