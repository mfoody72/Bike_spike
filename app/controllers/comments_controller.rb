class CommentsController < ApplicationController
	before_action :set_bike
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def new
    @comment = @bike.comments.build
  end

	def create
		@bike = Bike.find(params[:bike_id])
		@comment = @bike.comments.create(params[:comment].permit(:content))
		@comment.bike_id = @bike.id

		if @comment.save
			redirect_to bike_path(@bike)
		else
			render 'new'
		end
	end
	
  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private
    def set_comment
      @comment = @bike.comments.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end

    def comment_params
      params.require(:comment).permit(:rating)
    end
end
