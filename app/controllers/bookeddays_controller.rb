class BookeddaysController < ApplicationController
	before_action :all_tasks, only: [:index, :show, :create]
	respond_to :html, :js



	def create
	  @bookeddays = bike.booked_days

	  respond_to do |format|
	    format.html
	    format.json
	  end
	end
end

