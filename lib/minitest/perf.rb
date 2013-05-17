require 'minitest/perf/version'
require 'minitest/unit'

module MiniTest::Perf
  autoload :Run,    'minitest/perf/run'
  autoload :Test,   'minitest/perf/test'
  autoload :Suite,  'minitest/perf/suite'
  autoload :Cli,    'minitest/perf/cli'
  autoload :Plugin, 'minitest/perf/plugin'
  autoload :Persistence, 'minitest/perf/persistence'
  autoload :Statistics,  'minitest/perf/statistics'
end

class MiniTest::Unit::TestCase
  include MiniTest::Perf::Plugin
end
