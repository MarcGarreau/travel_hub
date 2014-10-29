require 'rails_helper'

describe User, type: :model do

  let(:user) { User.create(first_name: "John", last_name: "Doe") }

  it "is valid" do
    expect(user).to be_valid
  end
end
