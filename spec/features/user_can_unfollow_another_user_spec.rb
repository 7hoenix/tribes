require "rails_helper"

RSpec.describe "user can unfollow another user", type: :feature, vcr: true do
  describe "from within the app" do
    it "by clicking the unfollow button" do
      visit "/"
      click_on "Login"

      current_user = User.last
      following_count = UserPresenter.new(current_user).following
      tweets = current_user.service.tweets
      @tweet = tweets.find { |tweet| tweet.id == 659215168258183168 }
      within(".unfollow-#{@tweet.id}") do
        click_on "Unfollow"
        VCR.use_cassette("/user_can_unfollow_a_user after") do
          @new_following_count = UserPresenter.new(current_user).following
        end
        expect(@new_following_count).to eq(following_count - 1)
      end
    end
  end
end
