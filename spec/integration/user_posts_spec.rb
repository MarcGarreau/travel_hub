require 'rails_helper'

describe "User" do
  let(:user) { User.create!(first_name: "John", last_name: "Doe") }
  let(:post) { Post.create!(user_id: user.id, properties: {twitter_url: "http://twitter.com", tweet_date: "10/28/2014"}) }

  it "has an associated post" do
    user.reload
    post.reload
    expect(user.posts.first.properties["twitter_url"]).to eq("http://twitter.com")
    expect(user.posts.first.properties["tweet_date"]).to eq("10/28/2014")
  end
end
