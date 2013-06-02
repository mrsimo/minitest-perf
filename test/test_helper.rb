require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/setup'
require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/perf'

##
# We disable the real plugin or stuff gets all confusing
# in the tests when mocking and creating expectations.
class FakeRun
  def start(*pars); end
  def finish(*pars); end
end

MiniTest::Perf::Plugin.class_eval do
  def current_perf_run
    @current_perf_run ||= FakeRun.new
  end
end
