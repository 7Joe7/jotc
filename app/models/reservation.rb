class Reservation < ActiveRecord::Base
  belongs_to :user

  validates :time_from, presence: true
  validates :time_to, presence: true
  validates :user_id, presence: true

  def send_reserved_confirmation
    ReservationMailer.deliver_reservation_information(self)
    ReservationMailer.deliver_reservation_confirmation(self)
  end

  def send_meeting_confirmation
    ReservationMailer.deliver_meeting_confirmation(self)
  end
end
