require "rails_helper"

RSpec.describe "user can retweet a tweet", type: :feature, vcr: true do
  describe "from within the app" do
    it "by clicking the retweet button" do
      visit "/"
      click_on "Login"

      VCR.use_cassette("/user_can_retweet_a_tweet after") do
        within(css: "retweeting-1") do
          click_on "Retweet"
          expect(retweet_count).to eq(1)
        end
      end
    end
  end
end
