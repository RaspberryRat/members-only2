class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    require(:post).permit(:title, :body, :current_user[:id])
  end

end
