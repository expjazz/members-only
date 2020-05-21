class PostsController < ApplicationController
  before_action :user_signed_in?, only: %i[new create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Your post was created successfully'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
