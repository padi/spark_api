require 'rubygems'
require 'logger'
require 'multi_json'

require 'spark_api/version'
require 'spark_api/configuration'
require 'spark_api/multi_client'
require 'spark_api/authentication'
require 'spark_api/response'
require 'spark_api/paginate'
require 'spark_api/request'
require 'spark_api/connection'
require 'spark_api/client'
require 'spark_api/faraday_middleware'
require 'spark_api/primary_array'
require 'spark_api/options_hash'
require 'spark_api/models'

# declare that this gem is exclusive to RubyMotion
unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(
    File.join(File.dirname(__FILE__), 'spark/**/*.rb')
  ).each do |file|
    app.files.unshift(file)
  end
end
