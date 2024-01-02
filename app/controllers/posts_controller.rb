
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      @posts = Post.all

      render json: @posts,status: :ok
     
    # @posts = Post.includes(:comments,:author)
    # render json: @posts.as_json(include: { comments: {},author:{} }), status: :ok
    end
  
    def show
      @post = Post.find(params[:id])
      render json: @post, status: :ok
      # @post=Post.includes(:comments,:author)
      # render json: @post.as_json(include: { comments: {},author:{} }), status: :ok


    end
  
    def new
      @post = Post.new
      render json: @post, status: :ok

    end
  
    def create
     
      @post = Post.new(post_params)
      
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  
    def edit
      @post = Post.find(params[:id])
      render json: @post, status: :ok

    end
  
    def update
      @post = Post.find(params[:id])
      
      if @post.update(post_params)
        render json: @post, status: :ok


        redirect_to posts_path
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
  
      if @post.destroy
        redirect_to posts_path
      else
        render :index
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :author_id,:image)
    end
  end
  