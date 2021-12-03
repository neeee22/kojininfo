class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @posts = Post.all
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  private
  def post_params 
    params.require(:post).permit(:name, :address, :mail)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
