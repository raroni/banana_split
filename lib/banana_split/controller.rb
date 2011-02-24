module BananaSplit
  module Controller
    extend ActiveSupport::Concern

    def included(base)
      helper_method :current_user_id
    end

    module InstanceMethods

      def ab_goal(test_name, value = 1)
        test_run = AbTestRun.where(:user_id => current_user_id).last
        if test_run && test_run.value == 0
          test_run.update_attribute(:value, value)
        end
      end

      def current_user_id
        current_user.id
      end
    end

  end
end
