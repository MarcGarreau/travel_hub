require 'rails_helper'

describe Post, type: :model do

  let(:post) { Post.create(user_id: 1) }

  it "is valid without a properties field" do
    expect(post).to be_valid
  end

end
