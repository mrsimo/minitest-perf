require 'test_helper'

module Minitest::Perf
  class RunTest < Minitest::Test
    def test_a_new_run_has_no_tests
      run = Run.new

      assert_empty run.tests
    end

    def test_creates_a_new_test_calling_start_and_finish
      run = Run.new(Time.at(0))
      run.start('SuiteName', 'test_something', Time.at(1))

      assert_empty run.tests

      run.finish('SuiteName', 'test_something', Time.at(8))

      assert_equal 1, run.tests.size

      test = run.tests.last

      assert_equal 'SuiteName',      test.suite
      assert_equal 'test_something', test.name
      assert_equal Time.at(0),       test.run
      assert_equal 7,                test.total
    end

    def test_persists_the_test
      run = Run.new
      run.start('SuiteName', 'test_something')

      Test.any_instance.expects(:persist)
      run.finish('SuiteName', 'test_something')
    end
  end
end
