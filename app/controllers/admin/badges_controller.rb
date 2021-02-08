class Admin::BadgesController < ActionController::Base
  layout "admin"
  before_action :find_badge, only: %i[destroy]
  def index
    @badges = Badge.all
  end

  def destroy
    redirect_to admin_badges_path, notice: @badge.destroy ? "Success!" : "Failed"
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
