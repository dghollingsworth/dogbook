class CommentsController < ApplicationController
	before_action :load_picture

	
  def show
  	@comment = Comment.find(params[:id])
  end

  def create
  	@comment = @picture.comments.build(comment_params)

		respond_to do |format|	  	
	    if @comment.save
	      format.html #show.html.erb
	      format.json{ render :json=>@comment }
	      format.js{}
	    else
	      format.html{ 'picture/show' }
	    end
	  end
  end


  def destroy
  	@comment = Comment.find(params[:id]) 
  	@comment.destroy
  	redirect_to picture_url(@comment.picture_id)
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :picture_id)
  end

  def load_picture
  	@picture = Picture.find(params[:picture_id])
  end
end
