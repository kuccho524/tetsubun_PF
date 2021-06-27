class TrainCommentsController < ApplicationController
  # コメント機能
  before_action :authenticate_user!

  # コメント作成
  def create
    @train = Train.find(params[:train_id])
    @train_comment = TrainComment.new(train_comment_params)
    @train_comment.train_id = @train.id
    @train_comment.user_id = current_user.id
    if @train_comment.save
      @train.create_notification_train_comment(current_user, @train_comment.id)
    else
      render 'error'
    end
  end

  # コメント削除
  def destroy
    @train = Train.find(params[:train_id])
    @train_comment = TrainComment.find(params[:id])
    @train_comment.destroy
  end

  # ストロングパラメーター
  private

  def train_comment_params
    params.require(:train_comment).permit(:user_id, :train_id, :comment)
  end
end
