# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../utils/web_driver_utils'
require_relative '../utils/config_utils'

class BusinessObject
  attr_accessor :logger

  def initialize
    @logger = ConfigUtils.logger
  end
end
