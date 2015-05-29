require 'test_helper'

class CrossroadsControllerTest < ActionController::TestCase

  TITLE = 'Crossroads'

  test 'should get home' do
    get :home
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE}"
  end

  test 'should get about' do
    get :about
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE} | About"
  end

  test 'should get contact' do
    get :contact
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE} | Contact"
  end
end
