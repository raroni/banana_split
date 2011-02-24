module BananaSplit
  module Controller
    extend ActiveSupport::Concern

    included do
      helper_method :session_id
    end

    module InstanceMethods

      def ab_goal(test_name, value = 1)
        test_run = AbTestRun.where(:session_id => session_id).last
        if test_run && test_run.value == 0
          test_run.update_attribute(:value, value)
        end
      end

      def session_id
        request.session_options[:id]
      end
    end

  end
end
