# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  private

  def rescue_record_not_found
    render plain: "#{self.controller_name.capitalize!} with (id=#{self.params[:id]}) was not found"
  end
end
