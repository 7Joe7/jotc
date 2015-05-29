require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:joe)
  end

  # test 'profile display' do
  #   get user_path(@user)
  #   assert_select 'title', full_title(@user.name)
  #   assert_match @user.name, response.body
  #   assert_select 'img.gravatar'
  #   assert_match @user.messages.count.to_s, response.body
  #   assert_select 'div.pagination'
  #   @user.messages.paginate(page: 1).each { |messages| assert_match messages.content, response.body }
  # end
end
