module Minitest
  module Perf
    module Statistics
      class << self
        def slowest_tests
          Minitest::Perf.persistence.sql(<<-SQL)
            SELECT suite, name, avg(total) as avg_total
            FROM tests
            GROUP BY suite, name
            ORDER BY avg_total DESC
            LIMIT 10
          SQL
        end

        def slowest_suites
          Minitest::Perf.persistence.sql(<<-SQL)
            SELECT suite, AVG(test_count), AVG(avg_total_per_test_run) as avg_total
            FROM (
              SELECT run, suite, COUNT(name) AS test_count, AVG(total) as avg_total_per_test_run
              FROM tests
              GROUP BY run, suite
            ) as temp
            GROUP BY suite
            ORDER BY avg_total desc
            LIMIT 10
          SQL
        end
      end
    end
  end
end
