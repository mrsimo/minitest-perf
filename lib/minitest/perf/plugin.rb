module MiniTest
  module Perf
    module Plugin
      def before_setup
        current_perf_run.start(self.class.name, __name__)
        super
      end

      def after_teardown
        super
        current_perf_run.finish(self.class.name, __name__)
      end

      def current_perf_run
        @@current_perf_run ||= MiniTest::Perf::Run.new
      end
    end
  end
end
