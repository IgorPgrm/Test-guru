# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}!"
      tests_path
    end
  end

  def rescue_record_not_found
    render plain: "#{self.controller_name.capitalize!} with (id=#{self.params[:id]}) was not found"
  end
end
