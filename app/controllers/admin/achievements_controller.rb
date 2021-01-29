class Admin::AchievementsController < ActionController::Base
  layout "admin"
  before_action :find_achievement, only: %i[edit update]
  before_action :available_image, only: %i[new create edit update]

  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new
  end

  def edit

  end

  def update

  end

  private

  def find_achievement
    @achievement = Achievement.find(params[:id])
  end

  def available_image
    @images = Dir.glob(Rails.application.assets.paths[1] + "/achievements/*.png").select { |e| File.file? e }
    @images.map! {|f| f.split("/").last}
  end
end
