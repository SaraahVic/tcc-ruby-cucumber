require 'allure-cucumber'

AllureCucumber.configure do |c|
  c.results_directory = 'allure-results'
  c.clean_results_directory = true
end