require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test 'message_received' do
    message = Message.create(email: 'test@example.com', content: 'hello')
    mail = MessageMailer.message_received(message)
    assert_equal 'Message to JOT confirmation', mail.subject
    assert_equal [message.email], mail.to
    assert_equal ['jot.company@gmail.com'], mail.from
  end

  test 'new_task' do
    message = Message.create(email: 'test@example.com', content: 'hello')
    mail = MessageMailer.new_task(message)
    assert_equal 'New message', mail.subject
    assert_equal ['jot.company@gmail.com'], mail.to
    assert_equal ['jot.company@gmail.com'], mail.from
    assert_match message.email, mail.body.encoded
    assert_match message.content, mail.body.encoded
  end
end
