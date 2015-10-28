class UsersController < ApplicationController
  def show
    @user = current_user
    @statuses = current_user.twitter_auth.home_timeline
  end
end
