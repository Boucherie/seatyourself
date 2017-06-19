class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @restaurant = reservation.new(reservation_params)
      if @reservation.save
        redirect_to reservation_path
      else
        redirect_to new_reservation_path
      end
  end

  def show
    @reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      redirect_back_or_to @reservation
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path
  end

  def reservation_params
    params_require(:reservation).permit(:date, :time, :party_size, :url)
  end

end
