class NotificationsController < ApplicationController
  before_action :load_association
  def index
    @notifications = @association.get_notifications.paginate(page: params[:page], :per_page => 10)
  end
end
