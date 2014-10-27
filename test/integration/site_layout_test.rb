require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joe)
  end

  test 'layout links' do
    get root_path
    assert_template 'basic_information/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', signup_path
  end

  test 'layout links when logged in' do
    log_in_as(@user)
    get root_path
    assert_template 'basic_information/home'
    assert_select 'a[href=?]', users_path
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', edit_user_path(@user)
    assert_select 'a[href=?]', user_path(@user)
  end
end
