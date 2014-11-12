class HidepostsController < ApplicationController
  def index
    @posts   = current_user.posts.where(hide: true).sort_by { |post| post.properties["created_date"]}
    @comment = Comment.new
  end

end
