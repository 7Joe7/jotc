class ReservationsController < ApplicationController
  def new
    @reservation = logged_in? ? current_user.reservations.build : Reservation.new
  end

  def edit
    @reservation.update(reservation_params)
    flash[:success] = 'Reservation updated.'
    redirect_to request.referrer || reservation_path
  end

  def destroy
    @reservation.destroy
    flash[:success] = 'Reservation cancelled.'
    redirect_to request.referrer || reservation_path
  end

  def create
    @reservation = logged_in? ? current_user.reservations.build(reservation_params) : Reservation.new(reservation_params)
    if @reservation.save
      @reservation.send_reserved_confirmation
      flash[:success] = 'Reservation accepted.'
      redirect_to reservation_path
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_from, :date_to, :place)
  end
end
