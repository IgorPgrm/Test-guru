# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  helper_method :current_user, :logged_in?

  private

  def rescue_record_not_found
    render plain: "#{self.controller_name.capitalize!} with (id=#{self.params[:id]}) was not found"
  end

  def authenticate_user!
    unless current_user
      cookies[:redirect_path] = request.path
      redirect_to login_path, alert: 'Are you a Guru? Verify your e-mail and password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
