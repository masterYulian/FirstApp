# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative 'page_object'

class LoginPage < PageObject

  def initialize
    super
    @web_driver.get ConfigUtils.config_data('addtional_data')['login_link']
  end

  def email
    @web_driver.find_element(:name, 'email')
  end

  def password
    @web_driver.find_element(:name, 'password')
  end

  def login_button
    @web_driver.find_element(:css, "input[type='submit']")
  end

  def navigate_to_register_button
    @web_driver.find_element(:css, 'a.btn.btn-primary')
  end

  def forgotten_password_navigation
    @web_driver.find_element(:css, 'div.form-group a')
  end

  def invalid_login_alert_danger
    @web_driver.find_elements(:css, 'div.alert.alert-danger')
  end
end