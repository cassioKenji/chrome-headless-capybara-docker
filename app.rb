require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: ['--headless'])
  Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
end

Capybara.app_host = 'http://www.google.com'

session = Capybara::Session.new(:selenium)

session.visit('/')
session.fill_in('q', :with => 'search')
session.find('btnK').click
