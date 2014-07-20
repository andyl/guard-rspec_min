# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/rspec_min/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-rspec_min"
  spec.version       = Guard::RspMin::VERSION
  spec.authors       = ["andyl"]
  spec.email         = ["andy@r210.com"]
  spec.summary       = %q{Minimal Guard plugin for Rspec}
  spec.description   = %q{Minimal Guard plugin for Rspec}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "guard"   , "~> 2.6.0"
  spec.add_dependency "rspec"   , "~> 3.0.0"
  spec.add_dependency "colored" , "~> 1.2.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
