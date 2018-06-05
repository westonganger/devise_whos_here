lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

gem_name = 'devise_whos_here'

require "#{gem_name}/version.rb"

Gem::Specification.new do |s|
  s.name        = gem_name
  s.version     =  DeviseWhosHere::VERSION
  s.author	= "Weston Ganger"
  s.email       = 'weston@westonganger.com'
  s.homepage 	= "https://github.com/westonganger/#{gem_name}"
  
  text = "Devise extension for logging current active users logged in using only the fast Rails cache and not your database"
  s.summary     = text
  s.description = text

  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")

  s.add_dependency 'devise'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'bundler'

  s.required_ruby_version = '>= 1.9.3'
  s.require_path = 'lib'
end
