class Admin::AchievementsController < ActionController::Base
  layout "admin"
  def index
    @ach = Achievement.all
  end
end
