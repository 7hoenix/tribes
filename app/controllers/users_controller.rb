class UsersController < ApplicationController
  def show
    @user = UserPresenter.new(current_user)
  end

  def unfollow
    current_user.service.unfollow(params[:screen_name])
    redirect_to current_user
  end
end
