class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categorys = Category.all
  end

  def show
  end
end
