class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def destroy
  end

  private

  def message_params
  end
end
