class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_post, only: %i[show edit update destroy]


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        flash.now[:error] = "Your post wasn't submitted"
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "You have updated your post."
    else
      flash[:error] = "You didn't follow the instructions dummy."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
