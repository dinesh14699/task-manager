class Task < ApplicationRecord
  belongs_to :user, optional: true
  enum status: %i[In-progress Done backlog]
  validates :title, :deadline, presence: true




  def self.check_deadlines_and_send_emails
    pending_tasks = where("deadline <= ?", 1.hour.from_now).or(where("deadline <= ?", 1.day.from_now)).where.not(status: "Done")

    pending_tasks.each do |task|
      TaskMailer.task_remainder_mail(task).deliver_now
    end
  end

end
