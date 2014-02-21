require "rubygems"
require "bundler/setup"
#require "rspec"
require "pry"
require "singleton"

require_relative '../config/config_loader'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end
