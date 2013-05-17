require 'sqlite3'

module MiniTest
  module Perf
    module Persistence
      class << self
        def write(test)
          db.execute <<-SQL, [test.run.to_s, test.suite, test.name, test.total]
            INSERT INTO tests (run, suite, name, total)
            VALUES (?, ?, ?, ?)
          SQL
        end

        def read_tests
          db.execute("SELECT * FROM TESTS").map do |run, suite, name, total|
            Test.new(run, suite, name, total)
          end
        end

        def sql(query)
          db.execute query
        end

        private

        def db
          @@db ||= begin
                     db = SQLite3::Database.new ".minitest-perf.db"
                     db.execute <<-SQL
                      create table if not exists tests (
                        run varchar(255),
                        suite varchar(255),
                        name varchar(255),
                        total float
                      );
                     SQL
                     db
                   end
        end
      end
    end
  end
end
