# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative 'config_utils'

class WebDriverUtils
  private_class_method :new

  def self.get_web_driver
    return @web_driver unless @web_driver.nil?
    Selenium::WebDriver::Firefox.driver_path = 'src/geckodriver'
    @web_driver = Selenium::WebDriver.for :firefox, marionette: true
    @web_driver.manage.window.maximize
    @web_driver.manage.timeouts.implicit_wait = 10
    @web_driver.manage.timeouts.page_load = 10
    @web_driver.manage.timeouts.script_timeout = 10
    @web_driver
  end

  def self.quit
    unless get_web_driver.nil?
      @web_driver.quit
      @web_driver = nil
      ConfigUtils.logger.info 'Web driver quit'
    end
  end

  def self.explicit_url_wait(url)
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    begin
      wait.until { @web_driver.current_url.to_s.eql? url }
    rescue Selenium::WebDriver::Error::TimeOutError
      ConfigUtils.logger.error "Current url #{@web_driver.current_url}"
    end
  end
end
