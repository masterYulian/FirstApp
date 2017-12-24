# frozen_string_literal: true

require 'rspec'

describe 'Registration page' do
  before(:all) do
    @registration_bo = RegistrationBO.new
    $log.info 'Registration page spec test started'
  end

  context 'registration page negative tests group' do
    it 'should enter existing user account email - registration must be unsuccessful and alert danger message must be appear' do
      expect(@registration_bo.register_account?($invalid_user_email_data)).to be false
    end

    it "should don't enter one of required fields  - registration must be unsuccessful and danger message(s) must appear" do
      @registration_bo.clear_user_data
      expect(@registration_bo.register_account?($user_required_field_empty)).to be false
    end

    it 'should policy checkbox is not checked  - registration must be unsuccessful and danger message(s) must appear' do
      expect(@registration_bo.policy_alert_danger?).to be false
    end
  end

  context 'registration page positive tests group' do
    it 'should enter valid user account data - registration must be successful' do
      @registration_bo.clear_user_data
      expect(@registration_bo.register_account?($valid_user_data)).to be true
    end
  end

  after(:all) do
    WebDriverUtils.quit
    $log.info 'Registration page spec test completed'
  end
end
