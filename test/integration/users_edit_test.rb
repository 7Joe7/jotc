require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joe)
  end

  # test 'invalid edit' do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   patch user_path(@user), user: {name: '',
  #                                  email: 'foo@invalid',
  #                                  password: 'foo',
  #                                  password_confirmation: 'bar'}
  #   assert_template 'users/edit'
  # end
  #
  # test 'valid edit' do
  #   get edit_user_path(@user)
  #   log_in_as(@user)
  #   assert_redirected_to edit_user_path(@user)
  #   name = 'Joe Example'
  #   email = 'joe@example.com'
  #   patch user_path(@user), user: {name: name,
  #                                  email: email,
  #                                  password: 'password',
  #                                  password_confirmation: 'password'}
  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal @user.name, name
  #   assert_equal @user.email, email
  # end
end
