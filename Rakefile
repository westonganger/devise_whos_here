require File.expand_path(File.dirname(__FILE__) + '/lib/devise_whos_here/version.rb')
require 'bundler/gem_tasks'

task :test do 
  require 'rake/testtask'
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*test.rb']
    t.verbose = true
  end
end

task default: :test

task :console do
  require 'devise_whos_here'

  require 'irb'
  binding.irb
end
