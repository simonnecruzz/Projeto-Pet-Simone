require 'faker'
require 'factory_bot'
require 'hi_httparty'
require 'require_relative'
require 'dotenv'
require 'net/http'
require 'uri'

Dotenv.load('.env.qa')

include HiHttparty::RequestsType
HiHttparty.configure do |config_hihttparty|
  config_hihttparty.timeout_value = 20
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.definition_file_paths = %w[./spec/supports/factories]
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:suite) { FactoryBot.find_definitions }

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end