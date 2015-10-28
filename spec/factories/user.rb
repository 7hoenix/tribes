FactoryGirl.define do
  factory :user do
    name = Faker::Name.name
    uid "12345"
    screen_name Faker::Internet.user_name(name)
    oauth_token ENV["twitter_user_token"]
    oauth_token_secret ENV["twitter_user_secret"]
    profile_image "I-am-an-image-url"
    banner_image "cake/600x200"
  end
end
