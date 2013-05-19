require 'test_helper'

class PluginTest < MiniTest::Unit::TestCase
  def test_minitest_has_the_plugin_included
    assert_includes MiniTest::Unit::TestCase.included_modules, MiniTest::Perf::Plugin
  end
end
