set :output, "/home/dinesh/test/task-manager/cron_log.log"

every 5.minutes do
  rake "task:send_reminders", environment: 'development'
end
