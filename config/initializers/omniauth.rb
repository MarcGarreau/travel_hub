Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
end

