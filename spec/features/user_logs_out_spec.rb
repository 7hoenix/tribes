require "rails_helper"

RSpec.describe "user logs out", type: :feature, vcr: true do
  describe "by clicking logout" do
    it "after logging in" do
      visit "/"
      click_on "Login"
      expect(page).to have_content("Justin Holzmann")
      click_on "Logout"
      expect(page).to_not have_content("Justin Holzmann")
    end
  end
end
