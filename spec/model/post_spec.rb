require 'rails_helper'

describe Post, type: :model do

  let(:post) { Post.create(user_id: 1) }

  it "is valid without a properties field" do
    expect(post).to be_valid
  end

  it "is valid with properties field" do
    post.properties = { twitter_url: "twitter.com", tweet_date: "10/27/2014" }
    expect(post.properties["twitter_url"]).to eq("twitter.com")
    expect(post.properties["tweet_date"]).to eq("10/27/2014")
    expect(post).to be_valid
  end

  it "builds upon first login" do
    user     = User.create!(name: "Joe Shmoe", nickname: "joe")
    Post.login_post_builder(instagram_api_response, user)
    expect(user.posts.count).to eq 2
  end
end
