class PostsController < ApplicationController

  def feed
    @posts = current_user.posts.all
  end

  def trip
    @posts = current_user.posts.where()
  end

end
