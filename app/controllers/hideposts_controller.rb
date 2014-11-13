class HidepostsController < ApplicationController
  def index
    @posts   = current_user.posts.where(hide: true).sort_by { |post| post.properties["created_date"]}
    @comment = Comment.new
  end

  def create
    Post.find(params[:id].to_i).update_attribute(:hide, true)
    redirect_to feed_path
  end

  def destroy
    Post.find(params[:id].to_i).update_attribute(:hide, false)
    redirect_to feed_path
  end

end
