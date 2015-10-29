class RetweetsController < ApplicationController
  def new
  end

  def create
    current_user.service.retweet(params[:tweet])
    redirect_to current_user
  end
end
