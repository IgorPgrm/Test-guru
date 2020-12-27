# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  before_action :set_locale

  helper_method :current_user, :logged_in?

  private

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}!"
    resource.is_admin? ? admin_tests_path : tests_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) || I18n.default_locale
  end

end
