class RetweetsController < ApplicationController
  def create
    current_user.retweet(params[:uid])
    redirect_to current_user
  end
end
