class NotificationController < ApplicationController
  def index
    @noti = Notification.all
    render json: @noti
  end
end
