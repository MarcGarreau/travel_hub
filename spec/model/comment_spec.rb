require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:user)    { User.create(name: "Sally",
                              nickname: "the_sally") }
  let(:post)    { Post.create(user_id: user.id) }
  let(:comment) { Comment.create(post_id: post.id,
                                 user_id: user.id,
                                 body: "This is a comment.") }

  it "is valid" do
    expect(comment).to be_valid
  end

  it "is invalid without post_id" do
    comment.post_id = nil

    expect(comment).not_to be_valid
  end

  it "is invalid without user_id" do
    comment.user_id = nil

    expect(comment).not_to be_valid
  end

  it "is invalid without a body" do
    comment.body = nil

    expect(comment).not_to be_valid
  end

  it "knows its user" do
    expect(comment.user.name).to eq("Sally")
  end
end
