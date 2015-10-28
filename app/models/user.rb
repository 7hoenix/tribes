class User < ActiveRecord::Base
  def self.banner_converter(auth_info)
    auth_info.extra.raw_info.profile_banner_url + "/600x200"
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.uid                = auth_info.extra.raw_info.user_id
      new_user.banner_image       = User.banner_converter(auth_info)
      new_user.profile_image      = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_secret_key"]
      config.access_token        = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end
end
