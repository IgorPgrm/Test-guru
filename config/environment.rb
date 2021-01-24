# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.smtp_settings = { :domain  => 'localhost' }

# Initialize the Rails application.
Rails.application.initialize!
