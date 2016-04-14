require 'rails_helper'
require 'capybara/rails'
RSpec.configure do |config|
  config.include ActionView::Helpers::NumberHelper  
end