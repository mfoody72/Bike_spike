class BikesController < ApplicationController
	before_action :find_bike, only: [:show, :edit, :update, :destroy]

	def index
		@bikes = Bike.all.order("created_at DESC")
	end

	def show
	end

	def new
		@bike = Bike.new
	end

	def create
		@bike = Bike.new(bikes_params)

			if @bike.save
				redirect_to @bike
			else
				render 'new'
		end
	end

	def edit
	end

	def update
		if @bike.update(bikes_params)
			redirect_to @bike
		else
			render 'edit'
		end
	end

	def destroy
		@bike.destroy
		redirect_to root_path
	end

	private

	def bikes_params
		params.require(:bike).permit(:category, :title, :description)
	end

	def find_bike
		@bike = Bike.find(params[:id])
	end

	
end
