require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
  :browser => :chrome,
  :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
          'args' => [ "headless"]
        }
      )
  )
end

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:selenium)

session.visit('/')
session.fill_in('q', :with => 'search')
session.find('btnK').click
