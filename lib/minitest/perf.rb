require 'minitest/perf/version'
require 'minitest'

module Minitest::Perf
  autoload :Run,    'minitest/perf/run'
  autoload :Test,   'minitest/perf/test'
  autoload :Suite,  'minitest/perf/suite'
  autoload :Cli,    'minitest/perf/cli'
  autoload :Plugin, 'minitest/perf/plugin'
  autoload :Persistence, 'minitest/perf/persistence'
  autoload :Statistics,  'minitest/perf/statistics'

  class << self
    attr_writer :database_url
    attr_writer :persistence

    def database_url
      @database_url ||= ENV["MINITEST_PERF_DATABASE_URL"] ||
                        ENV["DATABASE_URL"] ||
                        'sqlite3://localhost/.minitest-perf.db'
    end
    def persistence
      @persistence ||= Persistence.new(database_url)
    end

  end
end

class Minitest::Test
  include Minitest::Perf::Plugin
end
