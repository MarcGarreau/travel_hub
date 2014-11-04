class PostsController < ApplicationController

  def feed
    @posts = current_user.posts.all
  end

end
