class HomesController < ApplicationController
  # top画面のコントローラー

  def top
    if user_signed_in?
      @trains_all = Train.includes(:user, :favorites)
      @user = User.find(current_user.id)
      @follow_users = @user.followings
      @follow_users_trains = @trains_all.where(user_id: @follow_users).order("created_at DESC")
      if @follow_users.empty?
        @trains = Train.all.reverse_order
      end
    else
      @trains = Train.all.reverse_order
    end
  end
end
