ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec'
require 'spec/autorun'
require 'spec/rails'

Spec::Runner.configure do |config|

  # Uncomment-out the next line if you want to see test data in the db.
  #config.use_transactional_fixtures = false
  
end



