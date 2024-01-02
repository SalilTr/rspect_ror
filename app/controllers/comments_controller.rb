class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(comment_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
      redirect_to comments_path
    else
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :a_blog_id)
  end
end
