# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'http_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "http_errors"
  spec.version       = HTTPErrors::VERSION
  spec.authors       = ["Thomas Fisher"]
  spec.email         = [""]
  spec.description   = %q{Provides a way to handle HTTP errors from Typhoeus requests and errors from Typhoeus parallel requests.}
  spec.summary       = %q{}
  spec.homepage      = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "pry", "~> 0.9.12.6"
  spec.add_development_dependency "version", "~> 1.0.0"
  spec.add_development_dependency "singleton"
end
