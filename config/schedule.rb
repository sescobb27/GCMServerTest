# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# ============================my cron jobs======================================
# ==============================================================================
# http://asciicasts.com/episodes/164-cron-in-ruby
# whenever -c coupon_update -> stop cron jobs
# whenever --update-crontab coupon_update
# crontab -l see the jobs that Whenever has added.
# Learn more: http://github.com/javan/whenever
set :environment, "development"
every :day, :at => "12:00am" do
	runner "Coupon.change_state"
	set :output, "log/cron_log.log"
end