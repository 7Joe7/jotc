require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:joe)
    # This code is not idiomatically correct.
    @message = @user.messages.build(content: 'Lorem ipsum', email: @user.email)
    @message_without_user = Message.new(content: 'Lorem ipsum', email: 'test@test.com')
  end

  test 'message should be valid' do
    assert @message.valid?
    assert @message_without_user.valid?
  end

  test 'order should be most recent first' do
    assert_equal Message.first, messages(:most_recent)
  end

  test 'content should be present ' do
    @message.content = ' '
    assert_not @message.valid?
  end

  test 'content should be at most 2000 characters' do
    @message.content = 'a' * 2001
    assert_not @message.valid?
  end
end
