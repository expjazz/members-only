class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
