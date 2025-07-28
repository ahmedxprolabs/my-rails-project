class CommentsController < ApplicationController
  before_action :set_comment, only: [ :show, :edit, :update, :destroy ]
  before_action :set_post, only: [ :new, :create, :index ]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: "Comment added"
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment updated"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post), notice: "Comment deleted"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
