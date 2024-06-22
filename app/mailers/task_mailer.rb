# app/mailers/task_mailer.rb

class TaskMailer < ApplicationMailer
  def task_remainder_mail(task)
    @task = task
    mail(to: task.user.email, from: 'no-reply@gmail.com', subject: "Task Deadline Alert")
  end
end
