#!/usr/bin/env ruby -w

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'minitest'

require 'devise_whos_here'

require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use!([Minitest::Reporters::DefaultReporter.new(color: true, slow_count: 5), Minitest::Reporters::ProgressReporter.new], ENV, Minitest.backtrace_filter)


class Test < MiniTest::Test

  def setup
  end

  #def test_model_methods
  #
  #end

  #def test_who_here_methods
  #  assert_equal Devise::WhosHere.get('User'), {}
  #  assert_equal Devise::WhosHere.write!('User', 1), {1 => Time.current}
  #end

  def test_exposes_version
    assert !DeviseWhosHere::VERSION.nil?
  end

  def teardown
  end

end
