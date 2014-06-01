class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@comment = @picture.comments.build(comments_params)

  	
  end

  def destroy
  	@comment = Comment.find(comment_params) 
  	@comment.destroy
  	redirect_to picture_path()
  end

  private
  def comment_params
  	require(:comment).permit(:content, :user_id, :picture_id)
  end

end
