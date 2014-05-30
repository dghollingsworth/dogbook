class PicturesController < ApplicationController
  def index
  	@pictures = Picture.all 
  end

  def new
  	@picture = Picture.new
  end

  def create
  	@picture = Picture.new(picture_params)

  	if @picture.save
  		redirect_to pictures_path
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  	@picture = Picture.find(params[:id])
  end

  def update
  	@picture = Picture.find(params[:id])

  	if @picture.update_attributes(picture_params)
  		redirect_to pictures_path
  	else
  		render :edit
  	end
  end

  private
  def picture_params
  	params.require(:picture).permit(:description, :url, :user_id)
  end
end