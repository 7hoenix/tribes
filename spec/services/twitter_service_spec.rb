require "rails_helper"

RSpec.describe TwitterService, vcr: true do
  before(:each) do
    user = create(:user)
    @service = TwitterService.new(user)
  end

  describe "#tweets" do
    it "returns a list of recent tweets from the home feed" do
      tweets = @service.tweets
      tweet = tweets.first

      expect(tweets.count).to eq(20)
      expect(tweet[:text]).to eq("Still working?")
      expect(tweet[:user].name).to eq("Justin Holzmann")
    end
  end

  describe "#followers" do
    it "returns a count of followers" do
      followers_count = @service.followers

      expect(followers_count).to be_a_kind_of(Integer)
    end
  end

  describe "#following" do
    it "returns a count of friends following" do
      following_count = @service.following

      expect(following_count).to be_a_kind_of(Integer)
    end
  end

  describe "#post" do
    it "posts a tweet" do
      message = "Chilling with my homeboys #live"
      @service.post(message)

      expect(@service.tweets.first.text).to eq(message)
    end
  end

  describe "#favorite" do
    it "favorites_tweet before" do
      tweet = @service.tweets.first

      pre_count = tweet.favorite_count
      @service.favorite(tweet)
      VCR.use_cassette("/TwitterService/_favorite/favorites_tweet after") do
        tweet = @service.tweets.first

        expect(tweet.favorite_count).to eq(pre_count + 1)
      end
    end
  end

  describe "#retweet" do
    it "retweet_tweet before" do
      tweet = @service.tweets.last

      retweet_count = tweet.retweet_count
      @service.retweet(tweet)
      VCR.use_cassette("/TwitterService/_retweet/retweet_tweet after") do
        tweet = @service.tweets.last

        expect(tweet.retweet_count).to eq(retweet_count + 1)
      end
    end
  end
end
