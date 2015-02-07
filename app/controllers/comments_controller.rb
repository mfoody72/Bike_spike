class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@bike = Bike.find(params[:bike_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.user_id
		@comment.bike_id = @bike.id

		if @comment.save
			redirect_to bike_path(@bike)
		else
			render 'new'
		end
	end
end
