class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def destroy_all
  end
end
