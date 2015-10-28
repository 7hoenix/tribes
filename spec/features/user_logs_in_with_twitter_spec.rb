require "rails_helper"

RSpec.describe "user logs in with twitter", type: :feature, vcr: true do
  describe "clicking login" do
    it "logs in a user and redirects them to their profile dashboard" do
      visit "/"
      expect(page.status_code).to eq(200)
      click_on "Login"
      expect(page).to have_content("Justin Holzmann")
    end
  end
end
