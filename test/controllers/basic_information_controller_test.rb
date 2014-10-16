require 'test_helper'

class BasicInformationControllerTest < ActionController::TestCase

  BASE_TITLE = 'JOTC'

  test 'should get home' do
    get :home
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | Home"
  end

  # test 'should get help' do
  #   get :help
  #   assert_response :success
  #   assert_select 'title', "#{BASE_TITLE} | Help"
  # end
  #
  # test 'should get about' do
  #   get :about
  #   assert_response :success
  #   assert_select 'title', "#{BASE_TITLE} | About Us"
  # end

  test 'should get contact' do
    get :contact
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | Contact"
  end

end
