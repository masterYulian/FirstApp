# frozen_string_literal: true

require 'allure-rspec'
require 'pry'
require 'rspec'
require_relative '../utils/config_utils'
require_relative '../utils/web_driver_utils'
require_relative '../models/user'
require_relative '../business_objects/login_bo'
require_relative '../business_objects/registration_bo'

AllureRSpec.configure do |config|
  config.include AllureRSpec::Adaptor
  # config.output_dir = 'reports/allure-results'
  config.logging_level = $log
  $valid_user_data = ConfigUtils.assign_user_object_properties('valid_user_credentials')

  $invalid_user_email_data = ConfigUtils.assign_user_object_properties('invalid_user_email_credentials')

  $user_required_field_empty = ConfigUtils.assign_user_object_properties('invalid_user_required_field_empty')

  $user_login_data = ConfigUtils.assign_user_object_properties('user_login_data')

  $log = ConfigUtils.logger
end
