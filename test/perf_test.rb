require 'test_helper'

module MiniTest
  class PerfTest < MiniTest::Unit::TestCase
    def test_default_database
      MiniTest::Perf.database_url = nil

      assert_equal 'sqlite3://localhost/.minitest-perf.db', MiniTest::Perf.database_url
    end

    def test_customizable_database
      MiniTest::Perf.persistence  = nil
      MiniTest::Perf.database_url = 'sqlite3://localhost/some_other_file.db'

      assert_equal 'sqlite3://localhost/some_other_file.db', MiniTest::Perf.database_url
      assert_equal 'sqlite3://localhost/some_other_file.db', MiniTest::Perf.persistence.database_url
    end
  end
end
