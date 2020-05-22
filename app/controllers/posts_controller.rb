class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Your post was created successfully'
      redirect_to root_path
    else
      if @post.errors.full_messages
        flash[:alert] = ''
        @post.errors.full_messages.each do |err|
          flash[:alert] += err + ' . ' 
        end
      end
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
