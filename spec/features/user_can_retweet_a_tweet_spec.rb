require "rails_helper"

RSpec.describe "user can retweet a tweet", type: :feature, vcr: true do
  describe "from within the app" do
    it "by clicking the retweet button" do
      visit "/"
      click_on "Login"

      current_user = User.last
      VCR.use_cassette("/user_can_retweet_a_tweet during") do
        tweets = UserPresenter.new(current_user).tweets
        @tweet = tweets.find { |tweet| tweet.id == 659215168258183168 }
        expect(@tweet.retweet_count).to eq(0)
      end
      within(".retweet-#{@tweet.id}") do
          click_on "Retweet"
        VCR.use_cassette("/user_can_retweet_a_tweet after") do
          tweets = UserPresenter.new(current_user).tweets
          new_tweet = tweets.find { |tweet| tweet.id == 659215168258183168 }
          expect(new_tweet.retweet_count).to eq(1)
        end
      end
    end
  end
end
