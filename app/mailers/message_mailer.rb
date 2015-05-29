class MessageMailer < ActionMailer::Base
  include ApplicationHelper
  default from: JOT_MAIL

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_received.subject
  #
  def message_received(message)
    @message = message
    mail to: message.email, subject: 'Message to JOT confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.new_task.subject
  #
  def new_task(message)
    @message = message
    mail to: JOT_MAIL, subject: 'New message'
  end


end
