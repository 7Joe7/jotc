ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'capybara/rails'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  BASE_TITLE = 'JOT'
  BASE_EMAIL = 'jot.company@gmail.com'

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # Returns true if a test user is logged in.
  def is_logged_in?
    !!session[:user_id]
  end

  # Logs in a test user.
  def log_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: {email: user.email,
                                 password: password,
                                 remember_me: remember_me}
    else
      session[:user_id] = user.id
    end
  end

  private

  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end


  # Add more helper methods to be used by all tests here...
end
