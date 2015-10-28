require "rails_helper"

RSpec.describe TwitterService, vcr: true do
  describe "#tweets" do
    it "returns a list of recent tweets from the home feed" do
      user = create(:user)
      service = TwitterService.new(user)

      tweets = service.tweets
      tweet = tweets.first

      expect(tweets.count).to eq(20)
      expect(tweet[:text]).to eq("Still working?")
      expect(tweet[:user].name).to eq("Justin Holzmann")
    end
  end
end
