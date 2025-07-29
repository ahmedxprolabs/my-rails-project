class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_userpost, only: %i[new create index]

  def index; end

  def new
    @comment = @comments.build
  end

  def create
    @comment = @comments.build(comment_params)
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

  def set_userpost
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def set_comment
    @comment = Comment.find(params[:id])
end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
