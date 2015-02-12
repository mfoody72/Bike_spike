class BookedDaysController < ApplicationController
	before_action :find_booked_day, only: [:show, :edit, :update, :destroy]
	  before_action :authenticate_user!
	def new
    @bike = Bike.find(params[:bike_id])
    @booked_day = @bike.booked_days.build
  end

	def create
    @bike = Bike.find(params[:bike_id])
    @booked_day = @bike.booked_days.build booked_day_params
    # binding.pry
    if @booked_day.save
      redirect_to bike_path(@bike)
    else
      render 'new'
    end
	end
	
  def edit
  end

  def update
    @booked_day.update(booked_day_params)
    redirect_to bike_path(@bike)
  end

  def destroy
    @booked_day.destroy
    redirect_to bike_path(@bike)
  end

  private

  def find_booked_day
    @booked_day = Booked_day.find(params[:id])
  end

  def booked_day_params
    params.require(:booked_day).permit(:booked_day)
  end

end

