class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    unless current_user
      flash[:alert] = ["You must be logged in to make a reservation!"]
      redirect_to root_path
      return
    end
    @reservation = Reservation.new(reservation_params)
      if @reservation.save
        flash[:notice] = "You have successfully made a reservation"
        redirect_to reservation_path(@reservation.id)
      else
        flash.now[:alert] = "Input incorrect or not present."
        redirect_to new_reservation_path
      end
  end

  def show
    unless current_user
      flash[:alert] = ["Must be logged in to view reservations"]
      redirect_to root_path
      return
    end
    @reservation = Reservation.find(params[:id])

    require_ownership_or_role
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    unless current_user
      flash[:alert] = ["You must be logged in to edit this reservation!"]
      redirect_to root_path
      return
    end

    require_ownership_or_role

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
    params.require(:reservation).permit(:date, :time, :party_size, :restaurant_id)
  end

  private

  def require_ownership_or_role
    unless User::ALLOWED_ROLES.include?(current_user.role)
      unless current_user.restaurants.include?(@reservation)
        flash[:alert] = ["This must be your reservation to make changes!"]
      end
    end
  end

end
