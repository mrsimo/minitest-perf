require 'test_helper'

module MiniTest::Perf
  class RunTest < MiniTest::Unit::TestCase
    def test_a_new_run_has_no_tests
      run = Run.new

      assert_empty run.tests
    end

    def test_creates_a_new_test_calling_start_and_finish
      run = Run.new
      run.start('SuiteName', 'test_something')

      assert_empty run.tests

      run.finish('SuiteName', 'test_something')

      test = run.tests.last

      assert_equal 'SuiteName',      test.suite
      assert_equal 'test_something', test.name
    end

    def test_persists_the_test
      run = Run.new
      run.start('SuiteName', 'test_something')

      Test.any_instance.expects(:persist)
      run.finish('SuiteName', 'test_something')
    end
  end
end
