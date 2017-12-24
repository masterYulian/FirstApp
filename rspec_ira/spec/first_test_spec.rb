describe 'Reviews' do

  before(:all) do
    puts 'Web driver started'
    Selenium::WebDriver::Firefox.driver_path = '/home/yulian/RubymineProjects/rspec_ira/geckodriver'
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 10
    @driver.get 'http://oppencart.herokuapp.com/index.php?route=product/product&path=20_27&product_id=41'
  end

  it 'shows error message' do
    expect(Reviews.new.test_reviews_empty_name(@driver)).to include ("Review Name must be between 3 and 25 characters!")
  end

  after(:all) do
    @driver.quit
    puts 'Web driver closed'
  end
end