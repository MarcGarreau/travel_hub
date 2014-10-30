class PostsController < ApplicationController

  def feed
    @posts = Post.all
  end


end
