set :output, "log/cron_log.log"
set :environment, "development"

every :day, :at => '10:00am' do
  runner "DailyEmailJob.perform_now"
end

every 1.minute do
  runner "WeeklyEmailJob.perform_now"
end
