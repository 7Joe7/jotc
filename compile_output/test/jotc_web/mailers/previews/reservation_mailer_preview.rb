# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/reservation_confirmation
  def reservation_confirmation
    ReservationMailer.reservation_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/reservation_information
  def reservation_information
    ReservationMailer.reservation_information
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/meeting_confirmation
  def meeting_confirmation
    ReservationMailer.meeting_confirmation
  end

end
