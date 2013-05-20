module MiniTest
  module Perf
    class Cli
      def run
        puts "Slowest individual tests"
        puts
        Statistics.slowest_tests.each do |suite, test_name, time|
          printf "% 12.2fms | %s#%s\n", time * 100, suite, test_name
        end

        puts
        puts
        puts "Slowest test suites"
        puts
        Statistics.slowest_suites.each do |suite_name, tests_count, avg_test_time|
          printf "% 12.2fms | % 4i | %s\n", avg_test_time * 100, tests_count, suite_name
        end
      end
    end
  end
end
