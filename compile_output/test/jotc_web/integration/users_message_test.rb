require 'test_helper'

class UsersMessageTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'invalid message' do
    get contact_path
    assert_no_difference 'Message.count' do
      post contact_path, reservation: {email: 'user@invalid', content: ' '}
    end
    assert_template 'messages/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid message' do
    get contact_path
    assert_difference('Message.count', 1) { post contact_path, reservation: {email: 'user@example.com', content: 'ahoj'} }
    assert_equal 2, ActionMailer::Base.deliveries.size
    assert_template root_path
  end
end
