class Admin::BadgesController < ActionController::Base
  layout "admin"
  def index
    @badges = Badge.all
  end
end
