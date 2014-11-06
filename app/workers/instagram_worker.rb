class InstagramWorker
  include Sidekiq::Worker

  def perform(response, user_id)
    user     = User.find_by_id(user_id)
    Post.login_post_builder(response, user)
  end
end
