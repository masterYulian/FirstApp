# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../page_objects/registration_page'
require_relative 'business_object'

class RegistrationBO < BusinessObject
  def initialize
    super
    @registration_page = RegistrationPage.new
  end

  def register_account?(user)
    apply_register_account_data(user)
    danger_messages = @registration_page.inputs_text_danger_messages.reject { |item| item.text.to_s.empty? }
    if !danger_messages.size.zero? || !policy_alert_danger?
      danger_messages.each { |item| @logger.error item.text }
      logger.info 'Register new account was unsuccessful'
      return false
    else
      logger.info 'Register new account was successful'
      return true
    end
  end

  def policy_alert_danger?
    policy_alert_danger_message = @registration_page.policy_alert_danger.attribute('innerText').to_s
    logger.error policy_alert_danger_message
    policy_alert_danger_message.empty?
  end

  def manage_of_policy_checkbox
    @registration_page.checkbox_policy.click
    @registration_page.button_continue.submit
  end

  def apply_register_account_data(user)
    @registration_page.first_name.send_keys(user.first_name)
    @registration_page.last_name.send_keys(user.last_name)
    @registration_page.email.send_keys(user.email)
    @registration_page.telephone.send_keys(user.telephone)
    @registration_page.company.send_keys(user.company)
    @registration_page.address_1.send_keys(user.address_1)
    @registration_page.city.send_keys(user.city)
    @registration_page.postcode.send_keys(user.postcode)
    @registration_page.country_id.find_element(:css, "option[value='#{user.country_id}']").click
    @registration_page.zone_id.find_element(:css, "option[value='#{user.zone_id}']").click
    @registration_page.password.send_keys(user.password)
    @registration_page.password_confirm.send_keys(user.password)
    @registration_page.radio_yes.click
    @registration_page.checkbox_policy.click
    @registration_page.button_continue.submit
  end

  def clear_user_data()
    @registration_page.first_name.clear
    @registration_page.last_name.clear
    @registration_page.email.clear
    @registration_page.telephone.clear
    @registration_page.company.clear
    @registration_page.address_1.clear
    @registration_page.city.clear
    @registration_page.postcode.clear
    @registration_page.password.clear
    @registration_page.password_confirm.clear
  end
end
