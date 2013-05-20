require 'test_helper'
require 'sqlite3'

module MiniTest::Perf
  class PersistenceTest < MiniTest::Unit::TestCase
    def setup
      @test = Test.new('run', 'suite', 'name', 10)
      Persistence.sql "delete from tests"
    end

    def test_exposes_a_sql_interface
      assert_instance_of Array, Persistence.sql('select * from tests')
    end

    def test_stores_the_test_as_a_new_row
      Persistence.write(@test)

      result = Persistence.sql "SELECT * FROM tests"

      assert_equal 1, result.size

      run, suite, name, total = result.first

      assert_equal 'run',   run
      assert_equal 'suite', suite
      assert_equal 'name',  name
      assert_equal 10,      total
    end
  end
end
