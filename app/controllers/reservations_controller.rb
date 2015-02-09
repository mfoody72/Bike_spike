class ReservationsController < ApplicationController
  before_action :set_bike
  before_action :find_reservation, only: [:destroy]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
end
	

	def new
    @reservation = @bike.reservations.build
  end

	def create
		@bike = Bike.find(params[:bike_id])
		@reservation = @bike.reservations.new(reservation_params)
		@reservation.bike_id = @bike.id
	    @reservation.user_id = current_user.id
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
    def set_reservations
      @reservation = @bike.reservations.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end

    def find_reservation
    @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
