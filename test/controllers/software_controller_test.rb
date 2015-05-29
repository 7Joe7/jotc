require 'test_helper'

class SoftwareControllerTest < ActionController::TestCase
  TITLE = 'Software'

  test 'should get home' do
    get :home
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE}"
  end

  test 'should get contact' do
    get :contact
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE} | Contact"
  end

  test 'should get about' do
    get :about
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE} | About"
  end
end
