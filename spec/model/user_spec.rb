require 'rails_helper'

describe User, type: :model do

  let(:user) { User.create(uid: 123456,
                           provider: "instagram",
                           name: "John Doe",
                           nickname: "johndozer",
                           image: "http://images.google.com/something.jpg" ) }

  it "is valid" do
    expect(user).to be_valid
  end
end
