require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'name blank' do
    @user.name = '   '
    assert_not @user.valid?
  end

  test 'email blank' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'too long name' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'too long email' do
    @user.email = 'a' * 256
    assert_not @user.valid?
  end

  test 'valid email address' do

    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'invalid email address' do

    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com form foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'not unique email' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'not unique case insensitive email' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'not unique case insensitive email in DTB' do
    @user.email.upcase!
    @user.save
    assert_equal @user.reload.email, @user.email.downcase
  end

  test 'too short password' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated?(:remember, '')
  end

end
