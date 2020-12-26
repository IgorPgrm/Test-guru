# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}!"
    resource.is_admin? ? admin_tests_path : tests_path
  end

end
