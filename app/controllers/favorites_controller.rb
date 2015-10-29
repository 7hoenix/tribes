class FavoritesController < ApplicationController
  def create
    current_user.service.favorite(params[:uid])
    redirect_to current_user
  end
end
