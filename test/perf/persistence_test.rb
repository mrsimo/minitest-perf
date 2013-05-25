require 'test_helper'
require 'sqlite3'

module MiniTest::Perf
  class PersistenceTest < MiniTest::Unit::TestCase
    TEST_DB_FILE = '.minitest-perf-tests.db'
    def setup
      File.delete(TEST_DB_FILE) rescue Errno::ENOENT # First time won't be here
      @persistence = Persistence.new("sqlite3://localhost/#{TEST_DB_FILE}")
      @persistence.sql "delete from tests"
    end

    def test_exposes_a_sql_interface
      assert_instance_of Array, @persistence.sql('select * from tests')
    end

    def test_really_creates_a_sqlite_db_file
      db = SQLite3::Database.new TEST_DB_FILE
      assert_instance_of Array, db.execute('select * from tests')
    end

    def test_stores_the_test_as_a_new_row
      @persistence.write(Test.new('run', 'suite', 'name', 10))

      result = @persistence.sql "SELECT * FROM tests"

      assert_equal 1, result.size

      run, suite, name, total = result.first

      assert_equal 'run',   run
      assert_equal 'suite', suite
      assert_equal 'name',  name
      assert_equal 10,      total
    end

    def test_uses_the_database_from_the_database_url
      assert_equal 'sqlite3://localhost/.minitest-perf-tests.db', @persistence.database_url
    end
  end
end
