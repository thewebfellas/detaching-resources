# encoding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "oswald/version"

Gem::Specification.new do |spec|
  spec.name          = "oswald"
  spec.version       = Oswald::VERSION
  spec.authors       = ["Vinicius Horewicz"]
  spec.email         = ["vinicius at horewi.cz"]
  spec.description   = %q{Oswald aims to ease the implementation of
                          services-oriented systems providing a simple
                          way for ruby objects to exchange messages
                          (publish/consume) using RabbitMQ.}
  spec.summary       = %q{Ruby services talking via RabbitMQ}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bunny", "~> 0.10"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

