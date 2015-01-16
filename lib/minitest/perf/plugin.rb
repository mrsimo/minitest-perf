module Minitest
  module Perf
    module Plugin
      def before_setup
        current_perf_run.start(self.class.name, name)
        super
      end

      def after_teardown
        super
        current_perf_run.finish(self.class.name, name)
      end

      def current_perf_run
        @@current_perf_run ||= Minitest::Perf::Run.new
      end
    end
  end
end
