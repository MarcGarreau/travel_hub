require 'rails_helper'

describe "User" do
  let(:user) { User.create!(name: "John Doe") }
  let(:post) { Post.create!(user_id: user.id, properties: {twitter_url: "http://twitter.com", tweet_date: "10/28/2014"}) }

  it "has an associated post with hstore parameters" do
    user.reload
    post.reload
    expect(user.posts.first.properties["twitter_url"]).to eq("http://twitter.com")
    expect(user.posts.first.properties["tweet_date"]).to eq("10/28/2014")
  end

  xit "has a image tweet with no text" do
    # a user signs on with instagram
    # adds their tweets
    # tweets do not need a caption
    # expect a tweet to have just a picture
  end
end
