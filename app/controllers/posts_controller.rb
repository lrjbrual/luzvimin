class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at DESC')#searching
    else
      @posts = Post.all.order('created_at DESC') #sorting using desc
    end
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.all
  end
end
