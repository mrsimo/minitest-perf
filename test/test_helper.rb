require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/perf'
require 'mocha/mini_test'
require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

##
# We disable the real plugin or stuff gets all confusing
# in the tests when mocking and creating expectations.
class FakeRun
  def start(*pars); end
  def finish(*pars); end
end

Minitest::Perf::Plugin.class_eval do
  def current_perf_run
    @current_perf_run ||= FakeRun.new
  end
end
