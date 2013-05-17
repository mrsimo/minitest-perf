module MiniTest
  module Perf
    class Run
      attr_reader :tests

      def initialize(started_at = Time.now)
        @tests       = []
        @started_at  = started_at
      end

      def start(suite, name)
        @test_start = Time.now
      end

      def finish(suite, name)
        test_total  = Time.now - @test_start

        add_test Test.new(
          @started_at, suite, name, test_total
        ).tap(&:persist)
      end

      def add_test(test)
        @tests << test
      end
    end
  end
end
