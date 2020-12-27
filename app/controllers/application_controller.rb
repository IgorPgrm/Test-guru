# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}!"
    resource.is_admin? ? admin_tests_path : tests_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) || I18n.default_locale
  end

end
