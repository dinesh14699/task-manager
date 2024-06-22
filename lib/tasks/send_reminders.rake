namespace :task do
  desc "Send reminders"
  task send_reminders: :environment do
    Task.check_deadlines_and_send_emails
  end
end
