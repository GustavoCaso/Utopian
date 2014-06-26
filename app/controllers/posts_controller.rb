class PostsController < ApplicationController
  before_action :require_login, except: [:utopia, :people_say, :show]
  before_action :set_post, except: [:index,:utopia,:people_say,:new,:create]

  def index
    @posts = Post.all
  end

  def utopia
    @posts = Post.where(category: "Utopia")
    @active = "Utopia"
  end

  def people_say
    @posts = Post.where(category: "People Say")
    @active = "People Say"
  end

  def show

  end

  def new
    @post = Post.new
    Post::MAX_PHOTOS.times{@post.pictures.build}
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post created successfuly"
    else
      render :new
    end
  end

  def edit
    photos_number = Post::MAX_PHOTOS - @post.pictures.count
    photos_number.times{@post.pictures.build}
  end

  def update
    if @post.update(posts_params)
      redirect_to post_path(@post), notice: "Post updated successfuly"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted successfuly"
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def posts_params
      params.require(:post).permit(:date,:title, :location, :short_description, :description, :category, pictures_attributes:[:id, :photo, :_destroy])
    end

end
