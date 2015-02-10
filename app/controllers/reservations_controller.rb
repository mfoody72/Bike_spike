class ReservationsController < ApplicationController

	def new
    @bike = Bike.find(params[:bike_id])
    @reservation = @bike.reservations.build
  end

	def create

	end
	
  def edit
  end

  def update
 
  end

  def destroy
  
  end


end
