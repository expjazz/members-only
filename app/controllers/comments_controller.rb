class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    byebug
    @comment.user_id = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(params[:id])
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
