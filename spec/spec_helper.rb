#encoding: utf-8
require "rubygems"
require "bundler/setup"
require "pry"

#loading rspec
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}
RSpec.configure do |config|
end

require "vkill_gems_methods"

