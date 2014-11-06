class TwitterWorker
  include Sidekiq::Worker

  def perform(json_response, user_id)
    user     = User.find_by_id(user_id)
    Post.tweet_post_builder(json_response, user)
  end
end
