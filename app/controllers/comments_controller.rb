class CommentsController < ApplicationController
	before_action :load_picture

  def show
  	@comment = Comment.find(params[:id])
  end

  def create
  	@comment = @picture.comments.build(comment_params)

    if @comment.save
      redirect_to picture_path(@picture.id), notice: 'Review created successfully'
    else
      render 'picture/show'
    end
  end

  end

  def destroy
  	@comment = Comment.find(comment_params) 
  	@comment.destroy
  	redirect_to picture_path()
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :picture_id)
  end

  def load_picture
  	@picture = Picture.find(params[:picture_id])
  end
end
