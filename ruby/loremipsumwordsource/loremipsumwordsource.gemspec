# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'loremipsumwordsource/version'

Gem::Specification.new do |gem|

  gem.platform    = Gem::Platform::RUBY
  gem.name        = 'loremipsumwordsource'
  gem.version     = Loremipsumwordsource::VERSION
  gem.summary     = ''
  gem.description = ''

  gem.required_ruby_version     = '>= 1.9.3'
  gem.required_rubygems_version = '>= 1.8.0'
  gem.license     = 'MIT'

  gem.authors   = ['Karl Freeman']
  gem.email    = ['karlfreeman@gmail.com']
  gem.homepage = 'http://karlfreeman.co.uk'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-nc'
  gem.add_development_dependency 'rspec-smart-formatter'
  
  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency 'cane'
  gem.add_development_dependency 'pry'

  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'  

end