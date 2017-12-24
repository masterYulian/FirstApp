class Reviews

  def test_reviews_empty_name(driver)
    driver.find_element(:css, '.rating > p > a:nth-child(7)').click
    driver.find_element(:css, 'input#input-name').send_keys('')
    i = 0
    num = 26
    until i > num do
        driver.find_element(:css, '#input-review').send_keys('1')
        i +=1
      end
      driver.find_element(:css, 'input[type="radio"]:nth-child(2)').click
      driver.find_element(:css, '#button-review').click
      message = driver.find_element(:css, '.alert.alert-danger').text
      message
    end
end