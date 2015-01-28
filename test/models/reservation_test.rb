require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
    @user = users(:joe)
    # This code is not idiomatically correct.
    @reservation = @user.reservations.build(time_from: Time.now, time_to: Time.now + 7200, place: @user.place || 'tadada')
  end

  test 'valid reservation' do
    assert @reservation.valid?
  end

  test 'invalid reservation' do
    @reservation.time_from = ' '
    @reservation.time_to = ' '
    @reservation.place = ' '
    assert_not @reservation.valid?
  end
end
