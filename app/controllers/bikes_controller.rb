class BikesController < ApplicationController
	before_action :find_bike, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	helper_method :set_average_rating

	def set_average_rating(bike)
		if bike.comments.blank?
			@avg_rating = 0
	    else
			@avg_rating = bike.comments.average(:rating).round(2)
	    end
	    @avg_rating
	end

	def index
		if params[:category].blank?
			@bikes = Bike.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@bikes = Bike.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		@comments = Comment.where(bike_id: @bike.id).order("created_at DESC")
		@avg_rating = set_average_rating( @bike )
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end

	def new
		@bike = current_user.bikes.build
	end

	def create
		@bike = current_user.bikes.build(bikes_params)
		if @bike.save
			redirect_to @bike
		else
			render 'new'
		end
	end


	def availability
		@availability = Availability.new(params[:availability])
		if @availability.save
			redirect_to @bike
		else
			render 'new'
		end

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
		params.require(:bike).permit(:category, :title, :image, :description, :url, :start_date, :end_date, :price, :category_id)
	end

	def find_bike
		@bike = Bike.find(params[:id])
	end

	
end
