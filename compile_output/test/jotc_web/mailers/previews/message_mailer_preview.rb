# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/message_received
  def message_received
    message = Message.first
    MessageMailer.new_task(message)
  end

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/new_task
  def new_task
    message = Message.first
    MessageMailer.new_task(message)
  end

end
