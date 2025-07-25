class PostsController < ApplicationController
  before_action :set_post, only: :destroy

  def index
    @posts = Post.all
  end

  def new ;end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "Post created successfully"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :content)
  end
end
