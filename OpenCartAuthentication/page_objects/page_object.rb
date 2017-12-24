# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../utils/web_driver_utils'
require_relative '../utils/config_utils'

class PageObject
  attr_accessor :logger, :web_driver

  def initialize
    @web_driver = WebDriverUtils.get_web_driver
    @logger = ConfigUtils.logger
  end
end
