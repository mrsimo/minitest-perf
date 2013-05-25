module MiniTest
  module Perf
    class Test
      attr_reader :run, :suite, :name, :total

      def initialize(run, suite, name, total)
        @run    = run
        @suite  = suite
        @name   = name
        @total  = total
      end

      def persist
        Perf.persistence.write(self)
      end
    end
  end
end
