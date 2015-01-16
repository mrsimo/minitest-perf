require 'test_helper'

class PluginTest < Minitest::Test
  def test_minitest_has_the_plugin_included
    assert_includes Minitest::Test.included_modules, Minitest::Perf::Plugin
  end
end
