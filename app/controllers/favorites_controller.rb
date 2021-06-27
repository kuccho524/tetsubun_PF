class FavoritesController < ApplicationController
  # いいね機能のコントローラー
  before_action :authenticate_user!

  # いいね一覧表示
  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:train_id)
    @favorites = Train.find(favorites)
  end

  # いいねする
  def create
    @train = Train.find(params[:train_id])
    @favorite = @train.favorites.new(user_id: current_user.id)
    @favorite.save
    @train.create_notification_favorite(current_user)
  end

  # いいね外す
  def destroy
    @train = Train.find(params[:train_id])
    favorite = @train.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
