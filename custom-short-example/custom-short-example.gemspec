$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'custom-short-example/version'
Gem::Specification.new do |s|
  s.name = 'custom-short-example'
  s.version = CustomShort::Example::VERSION.version
  s.summary = 'Custom Short Order Service'
  s.author = 'CHANGE ME'
  s.email = 'changeme@example.com'
  s.homepage = 'https://example.com'
  s.description = 'Custom Short Order Service: example'
  s.require_path = 'lib'
  s.license = 'Apache 2.0'
  s.add_runtime_dependency 'jackal', '~> 0.3.18'
  s.add_runtime_dependency 'carnivore-http', '~> 0.2.8'
  s.files = Dir['{lib}/**/**/*'] + %w(custom-short-example.gemspec)
end
