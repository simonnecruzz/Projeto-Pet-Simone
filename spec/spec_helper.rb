require "faker"
require "factory_bot"
require "hi_httparty"
#require "require_relative" #//TODO para que vc usaria isso? Faltou adicionar essa gem no gemfile
require "dotenv"
require "net/http" #//TODO para que usar esse cara se vc ja usa o HiHTTParty
require "uri"

Dotenv.load(".env.qa")

include HiHttparty::RequestsType
HiHttparty.configure do |config_hihttparty|
  config_hihttparty.timeout_value = 20
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.definition_file_paths = %w[./spec/supports/factories]
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|
  end

  config.before(:suite) { FactoryBot.find_definitions }
end
