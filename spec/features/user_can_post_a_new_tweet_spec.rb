require "rails_helper"

RSpec.describe "user can post a new tweet", type: :feature, vcr: true do
  describe "from within the app" do
    it "by typing it in the form and clicking submit" do
      visit "/"
      click_on "Login"
      fill_in "Text", with: "Chilling with my homies"
      click_on "Tweet"
      expect(page).to have_content("Chilling with my homies")
    end
  end
end
