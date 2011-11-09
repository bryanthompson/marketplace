# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'marketplace/version'
 
Gem::Specification.new do |s|
  s.name        = "marketplace"
  s.version     = Marketplace::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dave Ott"]
  s.email       = ["daveott@daveott.net"]
  s.homepage    = "http://github.com/daveott/marketplace"
  s.summary     = "Amazon MWS Ruby client library"
  s.description = "Amazon MWS Ruby client library"
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.files        = Dir.glob("{bin,lib,config}/**/*") + %w(README.md)
  s.require_path = 'lib'

  s.add_development_dependency("activesupport", ["~> 3.1.1"])
  s.add_development_dependency("cucumber", ["~> 1.1.1"])
  s.add_development_dependency("guard-focus", ["~> 0.0.1"])
  s.add_development_dependency("httparty", ["~> 0.8.1"])
  s.add_development_dependency("i18n", ["~> 0.6.0"])
  s.add_development_dependency("jeweler", ["~> 1.6.4"])
  s.add_development_dependency("rspec", ["~> 2.3.0"])
  s.add_development_dependency("ruby-debug19", ["~> 0.11.6"])
  s.add_development_dependency("webmock", ["~> 1.7.7"])
end
