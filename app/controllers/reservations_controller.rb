class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
	def new
    @bike = Bike.find(params[:bike_id])
    @reservation = @bike.reservations.build
  end

	def create
    @bike = Bike.find(params[:bike_id])
    @reservation = @bike.reservations.build reservation_params
    if @reservation.save
      redirect_to bike_path(@bike)
    else
      render 'new'
    end
	end
	
  def edit
  end

  def update
    @reservation.update(reservation_params)
    redirect_to bike_path(@bike)
  end

  def destroy
    @reservation.destroy
    redirect_to bike_path(@bike)
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
