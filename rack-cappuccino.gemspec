# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $:.include?(lib)
require "rack/cappuccino"

Gem::Specification.new do |s|
  s.name         = "rack-cappuccino"
  s.version      = Rack::Cappuccino::VERSION
  s.platform     = Gem::Platform::RUBY
  s.summary      = "Transform a Cappuccino app into a Rack app."
  s.description  = "Rack::Cappucciono serves up your Build/Release/__APPNAME__ folder as a Rack application."
  
  s.author       = 'Matte Noble'
  s.email        = 'me@mattenoble.com'
  s.homepage     = 'http://github.com/mnoble/rack-cappuccino'
  
  s.require_path = "lib"
  s.files        = ["Gemfile", "Gemfile.lock", "LICENSE", "README.rdoc", "Rakefile", "lib/rack/cappuccino.rb"]
  s.test_files   = Dir["spec/**/*"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]

  s.add_dependency "rack"
  s.add_dependency "rake"
end

