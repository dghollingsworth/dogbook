class PicturesController < ApplicationController
  def index
  	@pictures = Picture.all 
  end

  def new
  	@picture = Picture.new
  end

  def create
  	@picture = Picture.new(picture_params)

    respond_to  do |format|
    	if @picture.save
    		format.html {redirect_to picture_path(@picture.id)}
        format.js {}
    	else
    		format.html {render 'pictures/show'}
        format.js {}
    	end
    end
  end

  def show
  	get_picture

    @comment = @picture.comments.build
  end

  def edit
  	get_picture
  end

  def update
  	get_picture

  	if @picture.update_attributes(picture_params)
  		redirect_to picture_path(@picture.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	get_picture
  	@picture.destroy
  	redirect_to pictures_path
  end

  private
  def picture_params
  	params.require(:picture).permit(:description, :url, :user_id)
  end

  def get_picture
  	@picture = Picture.find(params[:id])
  end

end
