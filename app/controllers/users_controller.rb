class UsersController < ApplicationController
  def show
    @user = UserPresenter.new(current_user)
  end
end
