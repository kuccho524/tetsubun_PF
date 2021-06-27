class SearchesController < ApplicationController
  # 検索機能
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search]).page(params[:page]).per(7)
    else
      @trains = Train.looks(params[:search]).page(params[:page]).reverse_order.per(8)
    end
  end
end
