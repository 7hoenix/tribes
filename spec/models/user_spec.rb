require 'rails_helper'

RSpec.describe User, type: :model do
  it "can create a user" do
    user = build(:user)

    expect(user).to be_valid
  end
end
