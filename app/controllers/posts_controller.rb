class PostsController < ApplicationController
  def feed
    @posts   = current_user.posts.sort_by { |post| post.properties["created_date"]}
    @comment = Comment.new
  end

  def trip
    @posts = current_user.posts.where()
  end
end
