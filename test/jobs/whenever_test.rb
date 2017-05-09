require 'test_helper'

class WheneverScheduleTest < ActiveJob::TestCase
  setup do
    load 'Rakefile' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end

  test 'makes sure `runner` statements exist' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

    assert_equal 1, schedule.jobs[:runner].count

    # Executes the actual ruby statement to make sure all constants and methods exist:
    schedule.jobs[:runner].each { |job| instance_eval job[:task] }
  end

  test 'makes sure cron alive monitor is registered in minute basis' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

    assert_equal 'EmailJob.perform_now', schedule.jobs[:runner].first[:task]
    assert_equal "cd :path && :bundle_command :runner_command -e :environment ':task' :output", schedule.jobs[:runner].first[:command]
    assert_equal [:day, {:at=>"10:00am"}], schedule.jobs[:runner].first[:every]
  end
end