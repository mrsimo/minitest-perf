require 'test_helper'

module MiniTest::Perf
  class TestTest < MiniTest::Unit::TestCase
    def test_creation
      test = Test.new('run', 'suite', 'name', 10)

      assert_equal 'run',   test.run
      assert_equal 'suite', test.suite
      assert_equal 'name',  test.name
      assert_equal 10,      test.total
    end

    def test_persists_calls_persistence
      test = Test.new('run', 'suite', 'name', 10)

      MiniTest::Perf.persistence.expects(:write).with(test)

      test.persist
    end
  end
end
