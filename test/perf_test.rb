require 'test_helper'

module Minitest
  class PerfTest < Minitest::Test
    def test_default_database
      Minitest::Perf.database_url = nil

      assert_equal 'sqlite3://localhost/.minitest-perf.db', Minitest::Perf.database_url
    end

    def test_customizable_database
      Minitest::Perf.persistence  = nil
      Minitest::Perf.database_url = 'sqlite3://localhost/some_other_file.db'

      assert_equal 'sqlite3://localhost/some_other_file.db', Minitest::Perf.database_url
      assert_equal 'sqlite3://localhost/some_other_file.db', Minitest::Perf.persistence.database_url
    end
  end
end
