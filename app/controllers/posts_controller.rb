class PostsController < ApplicationController
  def feed
    @posts   = current_user.posts.where(hide: false).order("created_date DESC")
    # pull down to model
    @comment = Comment.new
  end

  def trip
    @posts = current_user.posts.where()
  end

  def update
    @post = Post.find(params[:id])
    @post.hide = true
    @post.save
    redirect_to feed_path
  end

end
