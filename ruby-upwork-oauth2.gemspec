# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'upwork/api/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-upwork-oauth2"
  spec.version       = Upwork::Api::VERSION
  spec.authors       = ["Maksym Novozhylov"]
  spec.email         = ["mnovozhilov@upwork.com"]
  spec.summary       = %q{Ruby bindings for Upwork API (OAuth2).}
  spec.description   = %q{Ruby bindings for Upwork API (OAuth2) makes your life easier due to working with your Upwork's data.}
  spec.homepage      = "http://developers.upwork.com"
  spec.license       = "Apache-2.0"

  spec.add_dependency 'oauth2', '~> 1.4'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.5", ">= 2.5.23"
  spec.add_development_dependency "rake", "~>12.3", ">= 12.3.3"
  spec.add_development_dependency "mocha", "~> 0"
  spec.add_development_dependency "test-unit", "~> 0"
end
