# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative 'page_object'
require_relative '../utils/web_driver_utils'

class RegistrationPage < PageObject
  def initialize
    super
    web_driver.get ConfigUtils.config_data('addtional_data')['registration_link']
  end

  def first_name
    @web_driver.find_element(:name, 'firstname')
  end

  def last_name
    @web_driver.find_element(:name, 'lastname')
  end

  def email
    @web_driver.find_element(:name, 'email')
  end

  def telephone
    @web_driver.find_element(:name, 'telephone')
  end

  def fax
    @web_driver.find_element(:name, 'fax')
  end

  def company
    @web_driver.find_element(:name, 'company')
  end

  def address_1
    @web_driver.find_element(:name, 'address_1')
  end

  def address_2
    @web_driver.find_element(:name, 'address_2')
  end

  def city
    @web_driver.find_element(:name, 'city')
  end

  def postcode
    @web_driver.find_element(:name, 'postcode')
  end

  def country_id
    @web_driver.find_element(:name, 'country_id')
  end

  def zone_id
    @web_driver.find_element(:name, 'zone_id')
  end

  def password
    @web_driver.find_element(:name, 'password')
  end

  def password_confirm
    @web_driver.find_element(:name, 'confirm')
  end

  def radio_yes
    @web_driver.find_element(:css, "input[name='newsletter'][value='1']")
  end

  def radio_no
    @web_driver.find_element(:css, "input[name='newsletter'][value='0']")
  end

  def checkbox_policy
    @web_driver.find_element(:css, "input[name='agree'][value='1']")
  end

  def button_continue
    @web_driver.find_element(:css, '.btn.btn-primary')
  end

  def inputs_text_danger_messages
    @web_driver.find_elements(:css, 'div.text-danger')
  end

  def policy_alert_danger
    @web_driver.find_element(:css, 'div.alert.alert-danger')
  end

  def account_created_header
    @web_driver.find_element(:css, 'div#content h1')
  end
end
