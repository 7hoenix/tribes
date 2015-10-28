# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "webmock"
require "vcr"
require "factory_girl_rails"

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<twitter_api_key>") { ENV["twitter_api_key"] }
  config.filter_sensitive_data("<twitter_secret>") { ENV["twitter_secret"] }
  config.filter_sensitive_data("<twitter_user_token>") { ENV["twitter_user_token"] }
  config.filter_sensitive_data("<twitter_user_secret>") { ENV["twitter_user_secret"] }
end


RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      uid: "1234",
      provider: "twitter",
      info: {
        image: "cake"
      },
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Justin",
          screen_name: "Justin Holzmann",
          profile_banner_url: "cake"
        }
      },
      credentials: {
        token: ENV["twitter_user_token"],
        secret: ENV["twitter_user_secret"]
      }
    })
  end

  config.include Capybara::DSL, type: :feature
  Capybara.app = Tribes::Application
  stub_omniauth

  config.include FactoryGirl::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
