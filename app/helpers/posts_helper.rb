module PostsHelper
  def wordy_time(post)
    from_time = post.properties["created_date"].to_time
    to_time   = Time.now
    distance_of_time_in_words(from_time, to_time, options = {include_seconds: true})
  end
end
