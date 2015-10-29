require "rails_helper"

RSpec.describe "when a user visits their dashboard", type: :feature, vcr: true do
  before(:each) do
    visit "/"
    click_on "Login"
  end

  it "they see a list of current tweets" do
    expect(page).to have_content("Tweeting from an app?")
    expect(page).to have_content("Win a Trip to Space")
  end

  it "they see the number of followers they have" do
    expect(page).to have_content("2")
  end

  it "they see the number of people following them" do
    expect(page).to have_content("1")
  end

  it "they see the number of tweets they have made" do
    expect(page).to have_content("20")
  end
end
