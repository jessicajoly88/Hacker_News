class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by {|post|
      (post.point + ((1/(Time.new - post.created_at) * 20000)))
    }
    @posts.reverse!
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.point = 0
    if !@post.url.include? "https://"
      @post.url = "https://" + @post.url
    end
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if params[:upvote]
      new_points = @post.point += 1
      @post.update(point: new_points)
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :url)
  end

end
