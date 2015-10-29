class TweetsController < ApplicationController
  def new
  end

  def create
    current_user.service.post(params[:text])
    redirect_to current_user
  end
end
