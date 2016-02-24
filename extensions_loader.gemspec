# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extensions_loader/version'

Gem::Specification.new do |spec|
  spec.name          = 'extensions_loader'
  spec.version       = ExtensionsLoader::VERSION
  spec.authors       = ['Andrew Page']
  spec.email         = ['andrew@andrewpage.me']

  spec.summary       = 'Avoid monkeypatching by dynamically loading Ruby extensions.'
  spec.description   = 'ExtensionsLoader is a lightweight gem that simplifies the extension of Ruby classes and modules. Rather than monkeypatching or managing your extension modules yourself, you can use ExtensionsLoader to easily include extension modules into pre-defined Ruby modules and classes.'
  spec.homepage      = 'https://github.com/andrewpage/extensions_loader'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
