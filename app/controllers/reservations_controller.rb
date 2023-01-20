class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:alert] = "You cannot book your own property!"

    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

    @reservation = current_user.reservations.build(reservation_params)
    @reservation.room = room
    @reservation.price = room.price
    @reservation.total = room.price * days
    @reservation.save

    flash[:notice] = "Booked Successfully"
    end
    redirect_to your_reservations_path
  end

  def your_trips
    @trips = current_user.reservations.order(start_date: :asc)
  end

  def destroy
    @reservations = Reservation.find(params[:id])
    @reservations.destroy
    flash[:notice] = "Reservation cancelled"
    redirect_back(fallback_location: request.referer)
  end

  def your_reservations
  
    @reservations = Reservation.where(user_id: current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
