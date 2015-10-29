require "rails_helper"

RSpec.describe UserPresenter, type: :model, vcr: true do
  before(:each) do
    user = create(:user, name: "Justin", screen_name: "Justin Holzmann")
    @up = UserPresenter.new(user)
  end

  describe "#banner_image" do
    it "returns the banner image for that user" do
      expect(@up.banner_image).to eq("cake/600x200")
    end
  end

  describe "#profile_image" do
    it "returns the profile image for that user" do
      expect(@up.profile_image).to eq("I-am-an-image-url")
    end
  end

  describe "#name" do
    it "returns the name for that user" do
      expect(@up.name).to eq("Justin")
    end
  end

  describe "#screen_name" do
    it "returns the screen name for that user" do
      expect(@up.name).to eq("Justin")
    end
  end

  describe "#tweets" do
    it "returns the tweets for that user" do
      expect(@up.tweets.count).to eq(20)
    end
  end

  describe "#tweet_count" do
    it "returns the total tweet count for that user" do
      expect(@up.tweet_count).to eq(20)
    end
  end

  describe "#followers" do
    it "returns the follower count for that user" do
      expect(@up.followers).to eq(2)
    end
  end

  describe "#following" do
    it "returns the following count for that user" do
      expect(@up.following).to eq(1)
    end
  end
end
