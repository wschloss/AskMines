class NotificationsController < ApplicationController
  # Action to remove all notifications for the signed in user
  # DELETE /notifications
  def remove
    Notification.delete(current_user.notifications)
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Notifications removed.' }
    end
  end
end
