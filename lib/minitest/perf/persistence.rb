require 'sqlite3'

module MiniTest
  module Perf
    class Persistence
      attr_reader :database_url

      def initialize(database_url = Perf.database_url)
        @database_url = database_url
      end

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
        @db ||= begin
                  db = SQLite3::Database.new sqlite3_db_name
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

      ##
      # Use a simple regexp, because for now, only sqlite3 is supported.
      def sqlite3_db_name
        @database_url.scan(/sqlite3:\/\/localhost\/(.+)/)[0][0]
      end
    end
  end
end
