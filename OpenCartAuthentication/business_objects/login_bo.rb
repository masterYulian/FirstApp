# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../page_objects/login_page'
require_relative 'business_object'
require_relative '../utils/web_driver_utils'

class LoginBO < BusinessObject
  def initialize
    super
    @login_page = LoginPage.new
  end

  def login?(user)
    login_action(user)
    WebDriverUtils.explicit_url_wait ConfigUtils.config_data('addtional_data')['account_link']
    if !WebDriverUtils.get_web_driver.current_url.to_s.eql? ConfigUtils.config_data('addtional_data')['account_link']
      print_alert_danger_message
      logger.error 'Login was unsuccessful'
      return false
    else
      logger.info 'Login was successful'
      return true
    end
  end

  def print_alert_danger_message
    login_alert_danger_message = @login_page.invalid_login_alert_danger[0].attribute('innerText').to_s
    logger.info login_alert_danger_message
  end

  def login_action(user)
    @login_page.email.send_keys(user.email)
    @login_page.password.send_keys(user.password)
    @login_page.login_button.submit
  end

  def clear_user_data
    @login_page.email.clear
    @login_page.password.clear
  end
end
