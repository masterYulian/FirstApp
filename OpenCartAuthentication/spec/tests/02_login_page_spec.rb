# frozen_string_literal: true

require 'rspec'

describe 'Login page' do
  before(:all) do
    $log.info 'Login page spec test started'
    @login_bo = LoginBO.new
  end

  context 'login page negative tests group' do
    it 'should enter invalid user account data - login must be unsuccessful and alert danger message must be appear' do
      expect(@login_bo.login?($invalid_user_email_data)).to be false
    end
  end

  context 'login page positive tests group' do
    it 'should enter valid registered user account data  - login must be successful' do
      @login_bo.clear_user_data
      expect(@login_bo.login?($user_login_data)).to be true
    end
  end

  after(:all) do
    WebDriverUtils.quit
    $log.info 'Login page spec test completed'
  end
end
