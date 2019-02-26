# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uiux/version'

Gem::Specification.new do |spec|
  spec.name          = 'uiux'
  spec.version       = UIUX::VERSION
  spec.authors       = ['Endri Gjiri']
  spec.email         = ['egjiri@gmail.com']

  spec.summary       = 'Provides colorful UI and utility functions for terminal output.'
  spec.description   = 'Provides colorful UI and utility functions for terminal output.'
  spec.homepage      = 'https://github.com/egjiri/uiux'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rainbow', '~> 2.2'
  spec.add_dependency 'awesome_print', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
